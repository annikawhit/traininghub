//
//  TeamDataView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-14.
//

import SwiftUI

struct TeamDataView: View {
    
    let participants = ["Participant 1", "Participant 2", "Participant 3", "Participant 4", "Participant 5"]
    
    let types = ["Type 1", "Type 2", "Type 3", "Type 4", "Type 5"]
    
    let locations = ["Location 1", "Location 2", "Location 3", "Location 4", "Location 5"]
        
    let columns: [GridItem] = [
        GridItem(.fixed(120)),
        GridItem(.fixed(80)),
        GridItem(.fixed(100))
    ]
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Text("team name")
                        .font(.largeTitle)
                        .foregroundColor(Color("CustomGreen"))
                        .multilineTextAlignment(.leading)
                        .bold()
                        .padding(.top, 20)
                        .padding(.leading, 30)
                    
                    Spacer()
                }
                
                Spacer()
                
                VStack {
                    Text("Team Members:")
                        .font(.title)
                        .foregroundColor(Color("CustomGreen"))
                        .bold()
                        .padding(.top, 10)
                        .padding(.leading, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(participants, id: \.self) { item in
                            Text(item)
                            
                            NavigationLink(destination: TeamDataView()){
                                Text("Edit")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20))
                                    .background(Color("CustomGreen"))
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                            }
                            
                            NavigationLink(destination: TeamDataView()){
                                Text("Delete")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20))
                                    .background(Color("CustomGreen"))
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                            }
                        }
                    }
                    .padding(.bottom, 20)
                }
                .background(Color("CustomBrown"))
                .cornerRadius(30)
                .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20))
                    
                VStack {
                    Text("Training Types:")
                            .font(.title)
                            .foregroundColor(Color("CustomGreen"))
                            .bold()
                            .padding(.top, 10)
                            .padding(.leading, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(types, id: \.self) { item in
                            Text(item)
                                
                            NavigationLink(destination: TeamDataView()){
                                Text("Edit")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20))
                                        .background(Color("CustomGreen"))
                                        .cornerRadius(15)
                                        .shadow(radius: 5)
                            }
                                
                            NavigationLink(destination: TeamDataView()){
                                Text("Delete")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20))
                                        .background(Color("CustomGreen"))
                                        .cornerRadius(15)
                                        .shadow(radius: 5)
                            }
                        }
                    }
                    .padding(.bottom, 20)
                }
                .background(Color("CustomBrown"))
                .cornerRadius(30)
                .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20))
                    
                VStack {
                    Text("Training Locations:")
                            .font(.title)
                            .foregroundColor(Color("CustomGreen"))
                            .bold()
                            .padding(.top, 10)
                            .padding(.leading, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(locations, id: \.self) { item in
                            Text(item)
                                
                            NavigationLink(destination: TeamDataView()){
                                Text("Edit")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20))
                                        .background(Color("CustomGreen"))
                                        .cornerRadius(15)
                                        .shadow(radius: 5)
                            }
                                
                            NavigationLink(destination: TeamDataView()){
                                Text("Delete")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20))
                                        .background(Color("CustomGreen"))
                                        .cornerRadius(15)
                                        .shadow(radius: 5)
                            }
                        }
                    }
                    .padding(.bottom, 20)
                }
                .background(Color("CustomBrown"))
                .cornerRadius(30)
                .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20))
                    
                Button(action: {deleteTeam()}){
                    Text("Delete Team")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 15, leading: 50, bottom: 15, trailing: 50))
                            .background(Color("CustomGreen"))
                            .cornerRadius(15)
                            .shadow(radius: 5)
                }
                .padding(.top, 50)
            }
        }
        .background(Color("CustomBackground"))
    }
    
    private func deleteTeam() {
            
    }
}

struct TeamDataView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDataView()
    }
}
