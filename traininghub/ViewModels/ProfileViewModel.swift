//
//  ProfileViewModel.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-17.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    @Published var showingJoinTeamViewModel = false
    @Published var showingCreateTeamViewModel = false
    @Published var name = ""
    @Published var userId = ""
    @Published var teamsIds: [String] = [""]
    @Published var teams: [Team] = []
    
    init() {
        
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).getDocument{ (document, error) in
            if let document = document, document.exists {
                // found user's name
                self.name = document.get("user_first_name") as? String ?? ""
                print("Found user's name.")
            } else {
                // couldn't find user's name
                print("Unable to find user's name")
            }
        }
        
        //get a list of all the teams associated with the current user
        getListOfTeams(for: userId) { teamsIds, error in
            if let error = error {
                print("Error fetching user teams: \(error)")
                return
            }
            
            if let teamsIds = teamsIds {
                self.teamsIds = teamsIds
                print("User Teams: \(teamsIds)")
                
                // get all the team items from the database
                self.getTeamsWithIDs(ids: teamsIds) { teams, error in
                    if let error = error {
                        print("Failed to fetch items: \(error)")
                        return
                    }
                    else{
                        self.teams = teams!
                        print("Found teams data.")
                    }
                }
                
            } else {
                print("No user teams found for user ID \(userId)")
            }
        }
    }
    
    func getListOfTeams(for userId: String, completion: @escaping ([String]?, Error?) -> Void) {
        let db = Firestore.firestore()
        let userRef = db.collection("users").document(userId)
        
        userRef.getDocument { (document, error) in
            if let error = error {
                // Handle error
                print("Error fetching document: \(error)")
                completion(nil, error)
                return
            }
            
            guard let document = document, document.exists else {
                // Document does not exist
                print("Document does not exist")
                completion(nil, nil)
                return
            }
            
            // Extract the user_teams array
            if let userTeams = document.get("user_teams") as? [String] {
                completion(userTeams, nil)
            } else {
                // user_teams field is missing or not an array
                print("No user_teams field or invalid format")
                completion(nil, nil)
            }
        }
    }
    
    func getTeamsWithIDs(ids: [String], completion: @escaping ([Team]?, Error?) -> Void) {
        let db = Firestore.firestore()
        
        // Reference to your Firestore collection
        let collectionRef = db.collection("teams")
        
        // Query documents where the 'id' field is in the given list of IDs
        collectionRef.whereField("id", in: ids).getDocuments { (querySnapshot, error) in
            if let error = error {
                // Handle error
                print("Error fetching documents: \(error)")
                completion(nil, error)
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                completion([], nil) // No teams found
                return
            }

            // Map documents to Team objects
            let teams: [Team] = documents.compactMap { document in
                do {
                    let team = try document.data(as: Team.self) // Firestore decoding
                    return team
                } catch {
                    print("Error decoding document \(document.documentID): \(error)")
                    return nil
                }
            }
            completion(teams, nil)
        }
    }
    
}
