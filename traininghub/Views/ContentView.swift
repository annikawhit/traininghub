//
//  ContentView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-06-22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            HomeView(userId: viewModel.currentUserId)
        } else{
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
