//
//  LoginView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-06-22.
//

import SwiftUI


struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        ZStack {
                GeometryReader { geometry in
                    VStack(spacing: 0) {
                        Color("CustomGreen")
                            .frame(height: geometry.size.height / 3)
                        Color("CustomBackground")
                    }
                }
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("logo here")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(Color("CustomBackground"))
                        .padding(.bottom, 180)
                    
                    Text("Sign in")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                        TextField("Email", text: $email)
                    }
                    .padding(.vertical, 10)
                    .overlay(Rectangle().frame(height: 1)
                        .padding(.top, 35), alignment: .bottom)
                    .padding(.horizontal, 50)
                    
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                        SecureField("Password", text: $password)
                    }
                    .padding(.vertical, 10)
                    .overlay(Rectangle().frame(height: 1).padding(.top, 35), alignment: .bottom)
                    .padding(.horizontal, 50)
                    
                    NavigationLink(destination: HomeView()){
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 15, leading: 70, bottom: 15, trailing: 70))
                            .background(Color("CustomBrown"))
                            .cornerRadius(15)
                            .shadow(radius: 5)
                            .padding(.top, 35)
                            .padding(.bottom, 10)
                    }
                    
                    HStack{
                        Text("Don't have an account?")
                            .foregroundColor(Color("CustomBrown"))
                        
                        NavigationLink(destination: CreateAccountView()){
                            Text("Register now")
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
