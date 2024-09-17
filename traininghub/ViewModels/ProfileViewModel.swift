//
//  ProfileViewModel.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-17.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var showingJoinTeamViewModel = false
    @Published var showingCreateTeamViewModel = false
    
    @Published var teams = ["team1", "team2", "team3", "team4"]
    @Published var name = "name"
    
    init() {}
    
}
