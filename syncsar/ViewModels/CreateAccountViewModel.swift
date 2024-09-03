//
//  CreateAccountViewModel.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-16.
//

import Foundation

class CreateAccountViewModel: ObservableObject {
    
    @Published var first_name = ""
    @Published var last_name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var cpassword = ""
    
    init() {}
}
