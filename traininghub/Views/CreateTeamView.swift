//
//  CreateTeamView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-16.
//

import SwiftUI

struct CreateTeamView: View {
    
    @StateObject var viewModel = CreateTeamViewModel()
    
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
                    
                    Text("Create a Team")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(Color("CustomBackground"))
                        .padding(.top, 50)
                        .padding(.bottom, 70)
                    
                    Spacer()
                    
                    TextField("Team Name", text: $viewModel.teamName)
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
                        viewModel.createTeam()
                    } label: {
                        HStack{
                            Spacer()
                            
                            ZStack {
                                Text("Create Team")
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
                        Text("Team already exists?")
                            .foregroundColor(Color("CustomBrown"))
                        
                        NavigationLink(destination: WelcomeJoinTeamView()){
                            Text("Join a team now")
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

struct CreateTeamView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTeamView()
    }
}
