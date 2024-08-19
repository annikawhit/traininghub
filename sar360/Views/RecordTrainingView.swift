//
//  RecordTrainingView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-06-26.
//

import SwiftUI

struct RecordTrainingView: View {
    @StateObject var viewModel = RecordTrainingViewModel()
    
    var body: some View {
        
        VStack{
            Text("Record Training Session")
                .padding(.top, 20)
                .font(.system(size: 30))
                .bold()
            
            ZStack{
                Color("CustomBrown").edgesIgnoringSafeArea(.all)
                
                Form{
                    
                    Section(header: Text("Select Team").foregroundColor(Color("CustomGreen"))) {
                        Picker("Team", selection: $viewModel.team) {
                            ForEach(viewModel.teams, id: \.self) { team in
                                Text(team)
                            }
                        }
                    }
                    
                    Section(header: Text("Name of the training session").foregroundColor(Color("CustomGreen"))) {
                        TextField("Name", text: $viewModel.name)
                    }
                    
                    Section(header: Text("Select Training Type").foregroundColor(Color("CustomGreen"))) {
                        Picker("Type", selection: $viewModel.type) {
                            ForEach(viewModel.types, id: \.self) { type in
                                Text(type)
                            }
                        }
                    }
                    
                    Section(header: Text("Date of the Training Session").foregroundColor(Color("CustomGreen"))){
                        DatePicker("Date", selection: $viewModel.date, displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle()) // Use graphical style for calendar view
                            .padding()
                    }
                    
                    Section(header: Text("Select Training Location").foregroundColor(Color("CustomGreen"))) {
                        Picker("Location", selection: $viewModel.location) {
                            ForEach(viewModel.locations, id: \.self) { location in
                                Text(location)
                            }
                        }
                    }
                    
                    Section(header: Text("Select Participants").foregroundColor(Color("CustomGreen"))) {
                        List {
                            ForEach(viewModel.participants, id: \.self) { participant in
                                Text(participant)
                            }
                        }
                        
                        Button(action: addParticipant){
                            Text("Add Participant")
                        }
                    }
                    
                    Section(footer: saveButton) {
                        EmptyView()
                    }
                    
                }
                .scrollContentBackground(.hidden)
            }
        }
        .background(Color("CustomBrown"))
    }
}

private var saveButton: some View {
        Button(action: saveForm) {
            Text("Save")
                .frame(maxWidth: .infinity)
                .font(.headline)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 15, leading: 70, bottom: 15, trailing: 70))
                .background(Color("CustomGreen"))
                .cornerRadius(15)
                .shadow(radius: 5)
                .padding(.bottom, 15)
    }
}

private func saveForm() {
    // Add save logic here
}

private func addParticipant() {
        //add participant
}

struct RecordTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        RecordTrainingView()
    }
}
