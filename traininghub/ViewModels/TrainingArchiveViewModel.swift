//
//  TrainingArchiveViewModel.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-17.
//

import Foundation

class TrainingArchiveViewModel: ObservableObject {
    @Published var showingRecordTrainingViewModel = false
    
    @Published var teams = ["team1", "team2", "team3", "team4"]
    @Published var team = ""
    @Published var myTrainings = false
    
    init() {}
}
