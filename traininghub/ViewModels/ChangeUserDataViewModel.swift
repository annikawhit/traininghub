//
//  ChangeUserDataViewModel.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-18.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ChangeUserDataViewModel: ObservableObject {
    @Published var fname = ""
    @Published var lname = ""
    @Published var email = ""
    @Published var password = ""
    @Published var cpassword = ""
    @Published var errorMessage = ""
    
    init() {
        //get current userid
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).getDocument { (document, error) in
            if let document = document, document.exists {
                
                print("Found current user data.")
                
                if let user_first_name = document.get("user_first_name") as? String {
                    DispatchQueue.main.async {
                        self.fname = user_first_name
                    }
                }
                if let user_last_name = document.get("user_last_name") as? String {
                    DispatchQueue.main.async {
                        self.lname = user_last_name
                    }
                }
                if let user_email = document.get("user_email") as? String {
                    DispatchQueue.main.async {
                        self.email = user_email
                    }
                }
                if let user_password = document.get("user_password") as? String {
                    DispatchQueue.main.async {
                        self.password = user_password
                        self.cpassword = user_password
                    }
                }
                
            } else {
                // If the ID is unique, return it
                print("Could not find current user data.")
            }
        }
    }
    
    func save(){
        guard validate() else{
            return
        }
        
        //get current userid
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).updateData([
            "user_first_name": fname,
            "user_last_name": lname,
            "user_email": email,
            "user_password": password
            ]) { err in
                if let err = err {
                    print("Error updating the user data: \(err)")
                } else {
                    print("The user data was successfully updated.")
                }
            }
    }
    
    private func validate() -> Bool{
        
        errorMessage = ""
        
        guard !fname.trimmingCharacters(in: .whitespaces).isEmpty,
              !lname.trimmingCharacters(in: .whitespaces).isEmpty,
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
        
        return true
        
    }
}
