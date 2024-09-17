//
//  CreateTeamViewModel.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-20.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class CreateTeamViewModel: ObservableObject {
    @Published var teamName = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func createTeam(){
        guard validate() else{
            return
        }
        
        //get current userid
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        generateUniqueTeamId { newTeamId in
            guard let newTeamId = newTeamId else { return }
                
            let db = Firestore.firestore()
            
            let newTeam = Team(
                id: newTeamId,
                team_name: self.teamName,
                team_members: [userId],
                team_guests: [],
                team_trainings: [],
                team_training_locations: [],
                team_training_types: [])

            // Save the team data with the unique ID
            db.collection("teams").document(newTeamId).setData(newTeam.asDictionary()) { error in
                if let error = error {
                        print("Error writing team model to database: \(error)")
                } else {
                        print("Team model was successfully written with ID \(newTeamId)")
                }
            }
            
            //add teamid to the current user's data
            db.collection("users").document(userId).updateData([
                    "user_teams": FieldValue.arrayUnion([newTeamId])
                ]) { err in
                    if let err = err {
                        print("Error adding new team id to the list of teams: \(err)")
                    } else {
                        print("The new team id was successfully added to the user's list of teams.")
                    }
                }
        }
    }
    
    private func validate() -> Bool{
        
        errorMessage = ""
        
        guard !teamName.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMessage = "Please fill in the Team Name field."
            return false
        }
        
        print("Passed validation")
        
        return true
        
    }
    
    private func generateUniqueTeamId(completion: @escaping (String?) -> Void){
        let db = Firestore.firestore()
            
        let newId = String(UUID().uuidString.prefix(8))

        // Query Firestore to check if the ID already exists
        db.collection("teams").document(newId).getDocument { (document, error) in
            if let document = document, document.exists {
                // If the document already exists, recursively generate a new ID
                print("ID already exists, generating a new one.")
                self.generateUniqueTeamId(completion: completion)
            } else {
                // If the ID is unique, return it
                print("ID is unique: \(newId)")
                completion(newId)
            }
        }
    }
}
