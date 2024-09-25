//
//  ChangeUserDataView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-15.
//

import SwiftUI

struct ChangeUserDataView: View {
    
    @StateObject var viewModel = ChangeUserDataViewModel()
    
    var body: some View {
        
        VStack{
            Text("Update Account Information")
                .padding(.top, 20)
                .font(.system(size: 30))
                .padding(.leading, 15)
                .padding(.trailing, 15)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .bold()
            
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(Color.red)
                    .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
            }
            
            ZStack{
                Color("CustomBackgound").edgesIgnoringSafeArea(.all)
                
                
                
                Form{
                    
                    Section(header: Text("First Name").foregroundColor(Color("CustomGreen"))) {
                        TextField("First Name", text: $viewModel.fname)
                    }
                    
                    Section(header: Text("Last Name").foregroundColor(Color("CustomGreen"))) {
                        TextField("Last Name", text: $viewModel.lname)
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
                    
                    
                    Section() {
                        Button{
                            viewModel.save()
                        } label: {
                            HStack{
                                Spacer()
                                
                                ZStack {
                                    Text("Save")
                                }
                                .frame(maxWidth: .infinity)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 15, leading: 70, bottom: 15, trailing: 70))
                                .background(Color("CustomGreen"))
                                .cornerRadius(15)
                                .shadow(radius: 5)
                                .padding(.bottom, 15)
                                
                                Spacer()
                            }
                            
                        }
                        .padding(.top, 10)
                        .listRowBackground(Color("CustomBackground"))
                    }
                    
                }
                .scrollContentBackground(.hidden)
            }
        }
        .background(Color("CustomBackground"))
    }
}

struct ChangeUserDataView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeUserDataView()
    }
}
