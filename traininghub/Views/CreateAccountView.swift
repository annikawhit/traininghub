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
                            TextField("Password", text: $viewModel.password)
                        }
                        
                        Section(header: Text("Confirm Password").foregroundColor(Color("CustomGreen"))) {
                            TextField("Confirm Password", text: $viewModel.cpassword)
                        }
                        
                        Section(footer: signUpButton) {
                            EmptyView()
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

private var signUpButton: some View {
        Button(action: signUpForm) {
            Text("Sign Up")
                .frame(maxWidth: .infinity)
                .font(.headline)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 15, leading: 70, bottom: 15, trailing: 70))
                .background(Color("CustomGreen"))
                .cornerRadius(15)
                .shadow(radius: 5)
    }
}

private func signUpForm() {
    // Add save logic here
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
