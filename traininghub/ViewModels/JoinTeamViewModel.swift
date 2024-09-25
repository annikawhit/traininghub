//
//  JoinTeamViewModel.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class JoinTeamViewModel: ObservableObject {
    @Published var teamID = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func joinTeam(){
        guard validateTeamId() else{
            return
        }
        
        Task {
            let documentExists = await checkIfTeamIdExists(collectionName: "teams", documentId: teamID)
            
            if documentExists {
                addNewTeamMember()
            } else {
                DispatchQueue.main.async {
                    self.errorMessage = "Team ID does not exist."
                }
            }
        }
    }
    
    func validateTeamId() -> Bool{
        errorMessage = ""
        
        guard !teamID.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMessage = "Please enter a team ID."
            return false
        }
        
        return true
    }
    
    func checkIfTeamIdExists(collectionName: String, documentId: String) async -> Bool {
        let db = Firestore.firestore()
        
        
        return await withCheckedContinuation { continuation in
            db.collection(collectionName).document(documentId).getDocument { (document, error) in
                if let document = document, document.exists {
                    print("Team ID exists in the database")
                    continuation.resume(returning: true)
                } else {
                    print("Team ID does not exist in the database")
                    continuation.resume(returning: false)
                }
            }
        }
    }
    
    func addNewTeamMember(){
        let db = Firestore.firestore()
        
        //get current userid
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        //add user id to list of team members
        db.collection("teams").document(teamID).updateData([
                "team_members": FieldValue.arrayUnion([userId])
            ]) { err in
                if let err = err {
                    print("Error adding new user id to the list of members: \(err)")
                    return
                } else {
                    print("The new user id was successfully added to the teams's list of members.")
                }
        }
        
        //add teamid to the current user's data
        db.collection("users").document(userId).updateData([
                "user_teams": FieldValue.arrayUnion([teamID])
            ]) { err in
                if let err = err {
                    print("Error adding new team id to the list of teams: \(err)")
                    return
                } else {
                    print("The new team id was successfully added to the user's list of teams.")
                }
        }
    }
}
