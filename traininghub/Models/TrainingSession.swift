//
//  TrainingSession.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-16.
//

import Foundation

struct TrainingSession: Codable, Identifiable{
    let id: String
    let training_name: String
    let training_team_id: String
    let training_participants: [String]
    let training_type: String
    let training_date: Date
    let training_start_time: Date
    let training_end_time: Date
    let training_location: String
}
