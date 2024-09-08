//
//  sar360App.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-06-22.
//

import SwiftUI
import FirebaseCore


@main
struct traininghubApp: App {
  
    init(){
        FirebaseApp.configure()
    }

  var body: some Scene {
    WindowGroup {
      NavigationView {
          LoginView()
      }
    }
  }
}
