//
//  SettingsViewModel.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-20.
//

import Foundation

class SettingsViewModel: ObservableObject {
    @Published var teams = ["team1", "team2", "team3", "team4"]
    
    init() {}
    
}
