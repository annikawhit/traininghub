//
//  TrainingArchiveItemView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-09-02.
//

import SwiftUI

struct TrainingArchiveItemView: View {
    
    let item: TrainingSession
    
    var dateString: String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: item.training_date)
    }
    
    var body: some View {
        NavigationLink(destination: RecordTrainingView()){
            HStack {
                VStack(alignment: .leading) {
                    Text(item.training_name)
                        .font(.body)
                    Text(dateString)
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                }
                
                Spacer()
                
                
            }
        }
    }
}

struct TrainingArchiveItemView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingArchiveItemView(item: .init(
            id: "123",
            training_name: "activity name",
            training_team_id: "456",
            training_participants: ["1234", "5678"],
            training_type: "type",
            training_date: Date(),
            training_location: "location"
        ))
    }
}
