//
//  LoginView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-06-22.
//

import SwiftUI


struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                    TextField("Username", text: $username)
                }
                .padding(.vertical, 10)
                .overlay(Rectangle().frame(height: 1).padding(.top, 35), alignment: .bottom)
                .padding(.horizontal, 50)
                            
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.gray)
                    SecureField("Password", text: $password)
                }
                .padding(.vertical, 10)
                .overlay(Rectangle().frame(height: 1).padding(.top, 35), alignment: .bottom)
                .padding(.horizontal, 50)
                
                NavigationLink(destination: CreateAccountView()){
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 15, leading: 70, bottom: 15, trailing: 70))
                        .background(Color.green)
                        .cornerRadius(30)
                        .shadow(radius: 5)
                        .padding()
                }
                NavigationLink(destination: CreateAccountView()){
                    Text("Don't have an account? Register now")
                        .foregroundColor(Color.green)
                        .multilineTextAlignment(.center)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
