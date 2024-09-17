//
//  HomeView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-06-22.
//


import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    var body: some View {
        
        TabView{
            TrainingArchiveView(userId: userId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(userId: "")
    }
}
