//
//  RecordTrainingViewModel.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-17.
//

import Foundation

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
    @Published var selectedParticipants = ""
    
    init() {}
    
    func save(){
        guard canSave else{
            return
        }
        
        //create model
        
        //save model
    }
    
    var canSave: Bool{
        //add guards to check data
        /* ex:
         guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
         }*/
        return true
    }
}
