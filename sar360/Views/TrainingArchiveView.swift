//
//  TrainingArchiveView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-06-26.
//

import SwiftUI

struct TrainingArchiveView: View {
    @StateObject var viewModel = TrainingArchiveViewModel()
    
    /*private let userId: String
    
    init(userId: String){
        self.userId = userId
    }*/
    
    let allItems = Array(1...50).map { "Item \($0)" } // Example data: 50 items
    @State private var currentIndex = 0
    private let itemsPerPage = 10

    var body: some View {
        NavigationView{
            VStack {
                
                Text("Training Archive")
                    .padding(.top, 20)
                    .font(.system(size: 30))
                    .bold()
                
                Form{
                    Picker("Team", selection: $viewModel.team) {
                        ForEach(viewModel.teams, id: \.self) { team in
                            Text(team)
                        }
                    }
                }
                .frame(height: 80)
                .scrollContentBackground(.hidden)
                
                ZStack{
                    VStack {
                        List(currentItems, id: \.self) { item in
                                NavigationLink(destination: RecordTrainingView()){
                                    Text(item)
                                }
                        }
                        .scrollContentBackground(.hidden)
                            
                        HStack {
                            Button(action: previousPage) {
                                Text("Previous")
                            }
                            .disabled(currentIndex == 0)
                            .foregroundColor(Color("CustomGreen"))
                                
                            Spacer()
                                
                            Button(action: nextPage) {
                                Text("Next")
                            }
                            .disabled(currentIndex + itemsPerPage >= allItems.count)
                            .foregroundColor(Color("CustomGreen"))
                        }
                        .padding()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("CustomBackground"))
            .toolbar{
                Button {
                    viewModel.showingRecordTrainingViewModel = true
                } label: {
                    Image(systemName: "plus")
                }
                .foregroundColor(Color("CustomGreen"))
            }
            .sheet(isPresented: $viewModel.showingRecordTrainingViewModel){
                RecordTrainingView()
            }
        }
        
    }
    

    private var currentItems: [String] {
            let endIndex = min(currentIndex + itemsPerPage, allItems.count)
            return Array(allItems[currentIndex..<endIndex])
    }
        
    private func nextPage() {
            if currentIndex + itemsPerPage < allItems.count {
                currentIndex += itemsPerPage
            }
    }
        
    private func previousPage() {
            if currentIndex - itemsPerPage >= 0 {
                currentIndex -= itemsPerPage
            }
    }
}

struct TrainingArchiveView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingArchiveView()
    }
}
