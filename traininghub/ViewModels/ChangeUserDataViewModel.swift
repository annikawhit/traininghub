//
//  ChangeUserDataViewModel.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-18.
//

import Foundation

class ChangeUserDataViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var cpassword = ""
    
    init() {}
    
    func save(){
        
    }
}
