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
            Text("Update Credentials")
                .padding(.top, 20)
                .font(.system(size: 30))
                .bold()
            
            ZStack{
                Color("CustomBackgound").edgesIgnoringSafeArea(.all)
                
                Form{
                    
                    Section(header: Text("Email").foregroundColor(Color("CustomGreen"))) {
                        TextField("Email", text: $viewModel.email)
                    }
                    
                    Section(header: Text("Password").foregroundColor(Color("CustomGreen"))) {
                        TextField("Password", text: $viewModel.password)
                    }
                    
                    Section(header: Text("Confirm Password").foregroundColor(Color("CustomGreen"))) {
                        TextField("Confirm Password", text: $viewModel.cpassword)
                    }
                    
                    
                    Section(footer: saveButton) {
                        EmptyView()
                    }
                    
                }
                .scrollContentBackground(.hidden)
            }
        }
        .background(Color("CustomBackground"))
    }
}

private var saveButton: some View {
        Button(action: saveForm) {
            Text("Save")
                .frame(maxWidth: .infinity)
                .font(.headline)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 15, leading: 70, bottom: 15, trailing: 70))
                .background(Color("CustomGreen"))
                .cornerRadius(15)
                .shadow(radius: 5)
                .padding(.bottom, 15)
    }
}

private func saveForm() {
    // Add save logic here
}

struct ChangeUserDataView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeUserDataView()
    }
}
