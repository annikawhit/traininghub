//
//  JoinTeamView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-22.
//

import SwiftUI

struct JoinTeamView: View {
    @StateObject var viewModel = JoinTeamViewModel()
    
    //doesn't contain the userid yet
    private var userId = ""
    
    var body: some View {
        ZStack {
                GeometryReader { geometry in
                    VStack(spacing: 0) {
                        Color("CustomGreen")
                            .frame(height: geometry.size.height / 2)
                        Color("CustomBackground")
                    }
                }
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    Text("Join a Team!")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(Color("CustomBackground"))
                        .padding(.top, 50)
                        .padding(.bottom, 90)
                    
                    Spacer()
                    
                    TextField("Team ID", text: $viewModel.teamID)
                        .padding(.vertical, 10)
                        .overlay(Rectangle().frame(height: 1)
                        .padding(.top, 35), alignment: .bottom)
                        .padding(.horizontal, 60)
                        .padding(.bottom, 15)
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    Button{
                        viewModel.joinTeam()
                    } label: {
                        HStack{
                            Spacer()
                            
                            ZStack {
                                Text("Join Team")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(EdgeInsets(top: 15, leading: 70, bottom: 15, trailing: 70))
                                    .background(Color("CustomBrown"))
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                                    .padding(.bottom, 10)
                            }
                            
                            Spacer()
                        }
                    }
                    
                    HStack{
                        Text("Team doesn't exists yet?")
                            .foregroundColor(Color("CustomBrown"))
                        
                        NavigationLink(destination: CreateTeamView()){
                            Text("Create a team now")
                                .foregroundColor(Color("CustomGreen"))
                        }
                    }
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 100)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct JoinTeamView_Previews: PreviewProvider {
    static var previews: some View {
        JoinTeamView()
    }
}
