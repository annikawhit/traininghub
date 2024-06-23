//
//  CreateAccountView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-06-22.
//

import SwiftUI

struct CreateAccountView: View {
    @State private var fname: String = ""
    @State private var lname: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var cpassword: String = ""
    
    var body: some View {
        VStack {
            TextField("First Name", text: $fname)
                .padding()
                .background(Color("CustomBrown"))
                .foregroundColor(Color.white)
                .cornerRadius(5)
                .padding()
            
            TextField("Last Name", text: $lname)
                .padding()
                .background(Color("CustomBrown"))
                .foregroundColor(Color.white)
                .cornerRadius(5)
                .padding()
            
            TextField("Email", text: $email)
                .padding()
                .background(Color("CustomBrown"))
                .foregroundColor(Color.white)
                .cornerRadius(5)
                .padding()
            
            TextField("Password", text: $password)
                .padding()
                .background(Color("CustomBrown"))
                .foregroundColor(Color.white)
                .cornerRadius(5)
                .padding()
            
            TextField("Confirm Password", text: $cpassword)
                .padding()
                .background(Color("CustomBrown"))
                .foregroundColor(Color.white)
                .cornerRadius(5)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color("CustomBackground"))
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
