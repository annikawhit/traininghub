//
//  CreateAccountViewModel.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-16.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class CreateAccountViewModel: ObservableObject {
    
    @Published var first_name = ""
    @Published var last_name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var cpassword = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func createAccount(){
        guard validate() else{
            return
        }
        
        print("here2")
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else{
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id, 
                           user_first_name: first_name,
                           user_last_name: last_name,
                           user_email: email,
                           user_password: password,
                           user_teams: [])
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
        print("done")
    }
    
    private func validate() -> Bool{
        
        errorMessage = ""
        
        guard !first_name.trimmingCharacters(in: .whitespaces).isEmpty,
              !last_name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !cpassword.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter a valid email address."
            return false
        }
        
        guard password == cpassword else{
            errorMessage = "Passwords do not match. Please try again."
            return false
        }
        
        guard password.count >= 8 else{
            errorMessage = "Password should contain at least 8 characters."
            return false
        }
        print("here1")
        return true
        
    }
}
