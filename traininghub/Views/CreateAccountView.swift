//
//  CreateAccountView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-06-22.
//

import SwiftUI

struct CreateAccountView: View {
    @StateObject var viewModel = CreateAccountViewModel()
    
    var body: some View {
        
        VStack{
            Text("Create an Account")
                .padding(.top, 20)
                .font(.system(size: 30))
                .bold()
            
            VStack{
                VStack{
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                            .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
                    }
                    
                    Form{
                        
                        Section(header: Text("First Name").foregroundColor(Color("CustomGreen"))) {
                            TextField("First Name", text: $viewModel.first_name)
                        }
                        
                        Section(header: Text("Last Name").foregroundColor(Color("CustomGreen"))) {
                            TextField("Last Name", text: $viewModel.last_name)
                        }
                        
                        Section(header: Text("Email").foregroundColor(Color("CustomGreen"))) {
                            TextField("Email", text: $viewModel.email)
                        }
                        
                        Section(header: Text("Password").foregroundColor(Color("CustomGreen"))) {
                            SecureField("Password", text: $viewModel.password)
                        }
                        
                        Section(header: Text("Confirm Password").foregroundColor(Color("CustomGreen"))) {
                            SecureField("Confirm Password", text: $viewModel.cpassword)
                        }
                        
                        Section() {
                            Button{
                                viewModel.createAccount()
                            } label: {
                                HStack{
                                    Spacer()
                                    
                                    ZStack {
                                        Text("Sign Up")
                                    }
                                    .frame(maxWidth: .infinity)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(EdgeInsets(top: 15, leading: 70, bottom: 15, trailing: 70))
                                    .background(Color("CustomGreen"))
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                                    
                                    Spacer()
                                }

                            }
                            .padding(.top, 10)
                            .listRowBackground(Color("CustomBrown"))
                        }
                        
                    }
                    .scrollContentBackground(.hidden)
                }
                .background(Color("CustomBrown"))
                .cornerRadius(30)
                .padding()
            }
            .background(Color("CustomBackground")).ignoresSafeArea()
        }
        .background(Color("CustomBackground"))
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
