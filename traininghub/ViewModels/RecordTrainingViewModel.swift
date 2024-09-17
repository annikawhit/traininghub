//
//  RecordTrainingViewModel.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-17.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RecordTrainingViewModel: ObservableObject {
    @Published var teams = ["team1", "team2", "team3", "team4"]
    @Published var types = ["t1", "t2", "t3", "t4"]
    @Published var locations = ["l1", "l2", "l3", "l4"]
    @Published var participants = ["p1", "p2", "p3", "p4"]
    
    @Published var team = ""
    @Published var name = ""
    @Published var type = ""
    @Published var date = Date()
    @Published var startTime = Date()
    @Published var endTime = Date()
    @Published var location = ""
    @Published var new_location = ""
    @Published var selectedParticipants: [String] = []
    
    @Published var errorMessage = ""
    
    init() {}
    
    func getUserData(){
        //get current userid
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        //save model
        let db = Firestore.firestore()
        
        //add code to get the user data from firebase
    }
    
    func save(){
        guard canSave else{
            return
        }

        //create model
        let newTrainingId = UUID().uuidString
        let newTrainingRecord = TrainingSession(
            id: newTrainingId,
            training_name: name,
            training_team_id: team,
            //training_participants: selectedParticipants, *** while participants functionality isn't set up***
            training_participants: ["user1", "user2"],
            training_type: type,
            training_date: date,
            training_start_time: startTime,
            training_end_time: endTime,
            training_location: location)
        
        print("model was created")
        
        //save model
        let db = Firestore.firestore()
        
        db.collection("trainingsessions")
            .document(newTrainingId)
            .setData(newTrainingRecord.asDictionary())
        print("model has been saved to the db")
    }
    
    var canSave: Bool{
        
        guard !team.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !type.trimmingCharacters(in: .whitespaces).isEmpty,
              !location.trimmingCharacters(in: .whitespaces).isEmpty
              /*!selectedParticipants.isEmpty ***while participants functionality isn't set up*** */ else{
            
            errorMessage = "Please fill in all fields."
            
            return false
        }
        
        return true
    }
}
