//
//  ProfileView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-17.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack{
                Text(viewModel.name)
                    .padding(.top, 20)
                    .font(.system(size: 30))
                    .bold()
                    
                HStack{
                    Button {
                        viewModel.showingJoinTeamViewModel = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .foregroundColor(Color("CustomGreen"))
                    .font(.system(size: 30))
                    .padding(.top, 0)
                    .padding(.leading, 30)
                    
                    Spacer()
                    
                    NavigationLink(destination: SettingsView()){
                        Image(systemName: "gearshape")
                    }
                    .foregroundColor(Color("CustomGreen"))
                    .font(.system(size: 30))
                    .padding(.top, 0)
                    .padding(.trailing, 30)
                }
                
                ZStack{
                    VStack {
                        List(viewModel.teams, id: \.self) { team in
                                NavigationLink(destination: TeamDataView()){
                                    Text(team)
                                }
                        }
                        .scrollContentBackground(.hidden)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("CustomBackground"))
        
            .sheet(isPresented: $viewModel.showingJoinTeamViewModel){
                JoinTeamView()
            }
        
            .sheet(isPresented: $viewModel.showingCreateTeamViewModel){
                CreateTeamView()
            }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
