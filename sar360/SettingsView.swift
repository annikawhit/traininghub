//
//  SettingsView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-06-26.
//

import SwiftUI

struct SettingsView: View {
    
    let teams = ["Team 1", "Team 2", "Team 3", "Team 4", "Team 5"]
    
    let columns: [GridItem] = [
        GridItem(.fixed(120)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    
    var body: some View {
            ScrollView{
                VStack {
                    Text("Settings")
                        .font(.largeTitle)
                        .foregroundColor(Color("CustomGreen"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                        .padding(.top, 75)
                        .padding(.bottom, 20)
                        .padding()
                    
                    
                    NavigationLink(destination: RecordTrainingView()){
                        Text("Change Email and Password")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                                .background(Color("CustomGreen"))
                                .cornerRadius(15)
                                .shadow(radius: 5)
                                .padding(.top, 10)
                                .padding(.bottom, 30)
                                .padding(.leading, 5)
                    }
                    
                    VStack {
                        Text("My Teams:")
                            .font(.title)
                            .foregroundColor(Color("CustomGreen"))
                            .bold()
                            .padding(.top, 10)
                            .padding(.leading, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(teams, id: \.self) { item in
                                Text(item)
                                
                                NavigationLink(destination: TeamDataView()){
                                    Text("Leave Team")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20))
                                        .background(Color("CustomGreen"))
                                        .cornerRadius(15)
                                        .shadow(radius: 5)
                                }
                                
                                NavigationLink(destination: TeamDataView()){
                                    Text("View Team Data")
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
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color("CustomBackground"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
