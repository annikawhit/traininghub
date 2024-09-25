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
    
    @Published var teams = ["team1", "team2", "team3", "team4"]
    @Published var name = ""
    
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
    }
    
}
