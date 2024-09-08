//
//  LoginView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-06-22.
//

import SwiftUI


struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
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
                        .padding(.top, 125)
                        .padding(.bottom, 150)
                    
                    Text("Sign in")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    VStack{
                        Form{
                            
                            HStack {
                                Image(systemName: "person")
                                    .foregroundColor(.gray)
                                TextField("Email", text: $viewModel.email)
                            }
                            .padding(.vertical, 10)
                            .overlay(Rectangle().frame(height: 1)
                                .padding(.top, 35), alignment: .bottom)
                            .padding(.horizontal, 50)
                            .listRowBackground(Color("CustomBackground"))
                            
                            
                            HStack {
                                Image(systemName: "lock")
                                    .foregroundColor(.gray)
                                SecureField("Password", text: $viewModel.password)
                            }
                            .padding(.vertical, 10)
                            .overlay(Rectangle().frame(height: 1).padding(.top, 35), alignment: .bottom)
                            .padding(.horizontal, 50)
                            .listRowBackground(Color("CustomBackground"))
                            .cornerRadius(10)
                            
                            Button{
                                viewModel.login()
                            } label: {
                                HStack{
                                    Spacer()
                                    
                                    ZStack {
                                        Text("Log In")
                                    }
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(EdgeInsets(top: 15, leading: 70, bottom: 15, trailing: 70))
                                    .background(Color("CustomBrown"))
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                                    
                                    Spacer()
                                }

                            }
                            .padding(.top, 10)
                            .listRowBackground(Color("CustomBackground"))
                        }
                        .background(Color("CustomBackground"))
                        .scrollContentBackground(.hidden)
                        
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
                    .padding(.bottom, 120)
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
