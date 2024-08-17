//
//  HomeView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-06-22.
//


import SwiftUI

struct HomeView: View {
    // @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        /*if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            
            
        } else{
            LoginView()
        }*/
        
        TabView{
            TrainingArchiveView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
        
        /*VStack{
            
            HStack{
                Text("name")
                .font(.largeTitle)
                .foregroundColor(Color("CustomGreen"))
                .multilineTextAlignment(.leading)
                .bold()
                .padding(.top, 20)
                .padding(.leading, 30)
                
                Spacer()
                
                NavigationLink(destination: SettingsView()){
                    Image(systemName: "gearshape")
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                        .padding(.top, 20)
                        .padding(.trailing, 30)
                }
            }
            
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    NavigationLink(destination: RecordTrainingView()){
                        Text("Record Training Session")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                                .background(Color("CustomGreen"))
                                .cornerRadius(15)
                                .shadow(radius: 5)
                                .padding(.top, 10)
                                .padding(.bottom, 10)
                    }
                    .frame(width: geometry.size.width / 2)
                            
                    NavigationLink(destination: TrainingArchiveView()){
                            Text("View Training Archive")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                                .background(Color("CustomGreen"))
                                .cornerRadius(15)
                                .shadow(radius: 5)
                                .padding(.top, 10)
                                .padding(.bottom, 10)
                    }
                    .frame(width: geometry.size.width / 2)
                }
                .padding(.top, 200)
            }
        }
        .background(Color("CustomBackground"))*/
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
