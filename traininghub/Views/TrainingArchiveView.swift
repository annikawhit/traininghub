//
//  TrainingArchiveView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-06-26.
//

import SwiftUI
import FirebaseFirestore

struct TrainingArchiveView: View {
    @StateObject var viewModel = TrainingArchiveViewModel()
    //@FirestoreQuery var trainingSessions: [TrainingSession]
    @FirestoreQuery var userTeams: [Team]
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
        self._userTeams = FirestoreQuery(collectionPath: "users/\(userId)/user_teams")
        //self._trainingSessions =
    }
    
    let allItems = Array(1...50).map { "Item \($0)" } // Example data: 50 items
    @State private var currentIndex = 0
    
    //var items: [TrainingSession]
    //private let itemsPerPage = 8

    var body: some View {
        NavigationView{
            VStack {
                Text("Training Archive")
                    .padding(.top, 20)
                    .font(.system(size: 30))
                    .bold()
                    
                HStack{
                    Spacer()
                    
                    Button {
                        viewModel.showingRecordTrainingViewModel = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .foregroundColor(Color("CustomGreen"))
                    .font(.system(size: 30))
                    .padding(.top, 1)
                    .padding(.trailing, 30)
                }
                
                Form{
                    Section(header: Text("Filters")) {
                            
                        Picker("Team", selection: $viewModel.team) {
                            ForEach(viewModel.teams, id: \.self) { team in
                                Text(team)
                            }
                        }
                            
                        Toggle(isOn: $viewModel.myTrainings) {
                            Text("Display Only My Trainings")
                        }
                        .toggleStyle(SwitchToggleStyle())
                            
                    }
                }
                .frame(height: 130)
                .scrollContentBackground(.hidden)
                
                ZStack{
                    VStack {
                        
                        List(allItems, id: \.self) { item in
                            NavigationLink(destination: RecordTrainingView()){
                                Text(item)
                            }
                        }
                        .scrollContentBackground(.hidden)
                            
                        /*HStack {
                            Button(action: previousPage) {
                                Text("Previous")
                            }
                            .disabled(currentIndex == 0)
                            .foregroundColor(Color("CustomGreen"))
                                
                            Spacer()
                                
                            Button(action: nextPage) {
                                Text("Next")
                            }
                            .disabled(currentIndex + itemsPerPage >= items.count)
                            .foregroundColor(Color("CustomGreen"))
                        }
                        .padding()*/
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("CustomBackground"))
            
            .sheet(isPresented: $viewModel.showingRecordTrainingViewModel){
                RecordTrainingView()
            }
        }
        
    }
    

    /*private var currentItems: [String] {
            let endIndex = min(currentIndex + itemsPerPage, items.count)
            return Array(items[currentIndex..<endIndex])
    }
        
    private func nextPage() {
            if currentIndex + itemsPerPage < items.count {
                currentIndex += itemsPerPage
            }
    }
        
    private func previousPage() {
            if currentIndex - itemsPerPage >= 0 {
                currentIndex -= itemsPerPage
            }
    }*/
}

struct TrainingArchiveView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingArchiveView(userId: "")
    }
}
