//
//  ChangeUserDataView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-15.
//

import SwiftUI

struct ChangeUserDataView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var cpassword: String = ""
    
    var body: some View {
        ScrollView{
            VStack {
                
                Text("Update Credentials")
                .font(.largeTitle)
                .foregroundColor(Color("CustomGreen"))
                .multilineTextAlignment(.leading)
                .bold()
                .padding(.top, 25)
                .padding(.trailing, 30)
                
                VStack{
                    Text("Email")
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 20)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color("CustomBackground"))
                        .foregroundColor(Color.black)
                        .cornerRadius(5)
                        .padding(EdgeInsets(top: 0, leading: 40, bottom: 15, trailing: 40))
                    
                    Text("Password")
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                    
                    TextField("Password", text: $password)
                        .padding()
                        .background(Color("CustomBackground"))
                        .foregroundColor(Color.black)
                        .cornerRadius(5)
                        .padding(EdgeInsets(top: 0, leading: 40, bottom: 15, trailing: 40))
                    
                    Text("Confirm Password")
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                    
                    TextField("Confirm Password", text: $cpassword)
                        .padding()
                        .background(Color("CustomBackground"))
                        .foregroundColor(Color.black)
                        .cornerRadius(5)
                        .padding(EdgeInsets(top: 0, leading: 40, bottom: 30, trailing: 40))
                }
                .background(Color("CustomBrown"))
                .cornerRadius(30)
                .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20))
                
                NavigationLink(destination: SettingsView()){
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 15, leading: 70, bottom: 15, trailing: 70))
                        .background(Color("CustomGreen"))
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        }
        .background(Color("CustomBackground"))
    }
}

struct ChangeUserDataView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeUserDataView()
    }
}
