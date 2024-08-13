//
//  WelcomeJoinTeamView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-06-25.
//

import SwiftUI

struct WelcomeJoinTeamView: View {
    
    @State private var teamID: String = ""
    
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
                    Text("Welcome!")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(Color("CustomBackground"))
                        .padding(.bottom, 50)
                        .padding(.top, 30)
                    
                    Text("Join a Team Now!")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(Color("CustomBackground"))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 150)
                    
                    TextField("Team ID", text: $teamID)
                        .padding(.vertical, 10)
                        .overlay(Rectangle().frame(height: 1)
                        .padding(.top, 35), alignment: .bottom)
                        .padding(.horizontal, 60)
                    
                    NavigationLink(destination: HomeView()){
                        Text("Join Team")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 15, leading: 70, bottom: 15, trailing: 70))
                            .background(Color("CustomBrown"))
                            .cornerRadius(15)
                            .shadow(radius: 5)
                            .padding(.top, 15)
                            .padding(.bottom, 10)
                    }
                    
                    HStack{
                        Text("Don't have a team?")
                            .foregroundColor(Color("CustomBrown"))
                        
                        NavigationLink(destination: CreateAccountView()){
                            Text("Create a team now")
                                .foregroundColor(Color("CustomGreen"))
                        }
                    }
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 100)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct WelcomeJoinTeamView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeJoinTeamView()
    }
}
