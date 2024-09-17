//
//  Team.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-16.
//

import Foundation

struct Team: Codable, Identifiable{
    let id: String
    let team_name: String
    let team_members: [String]
    let team_guests: [String]
    let team_trainings: [String]
    let team_training_locations: [String]
    let team_training_types: [String]
}
