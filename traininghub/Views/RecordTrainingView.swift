//
//  RecordTrainingView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-06-26.
//

import SwiftUI

struct RecordTrainingView: View {
    @StateObject var viewModel = RecordTrainingViewModel()
    
    init(){
        viewModel.getUserData()
    }
    
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
                            Text("Select Team").tag(nil as String?)
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
                            Text("Select Type").tag(nil as String?)
                            ForEach(viewModel.types, id: \.self) { type in
                                Text(type)
                            }
                        }
                    }
                    
                    Section(header: Text("Date/Time of the Training Session").foregroundColor(Color("CustomGreen"))){
                        DatePicker("Date", selection: $viewModel.date, displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .padding()
                        // Start Time Picker
                        DatePicker("Start Time", selection: $viewModel.startTime, displayedComponents: [.hourAndMinute])
                            .datePickerStyle(CompactDatePickerStyle())
                            .padding()
                                        
                        // End Time Picker
                        DatePicker("End Time", selection: $viewModel.endTime, displayedComponents: [.hourAndMinute])
                            .datePickerStyle(CompactDatePickerStyle())
                            .padding()
                    }
                    
                    Section(header: Text("Select Training Location").foregroundColor(Color("CustomGreen"))) {
                        Picker("Location", selection: $viewModel.location) {
                            Text("Select Location").tag(nil as String?)
                            ForEach(viewModel.locations, id: \.self) { location in
                                Text(location)
                            }
                            Button(action: showPopup){
                                Text("Add Location")
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
                    
                    Section() {
                        Button{
                            viewModel.save()
                        } label: {
                            VStack{
                                if !viewModel.errorMessage.isEmpty {
                                    Text(viewModel.errorMessage)
                                        .foregroundColor(Color.red)
                                }
                                
                                HStack{
                                    Spacer()
                                    
                                    ZStack {
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
                                    
                                    Spacer()
                                }
                            }

                        }
                        .listRowBackground(Color("CustomBrown"))
                    }
                    
                }
                .scrollContentBackground(.hidden)
            }
        }
        .background(Color("CustomBrown"))
    }
}

private func addParticipant() {
        //add participant
}
                                     
private func showPopup(){
    // show a popup that will prompt the user to enter the new location name
}

struct RecordTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        RecordTrainingView()
    }
}
