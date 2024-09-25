//
//  SettingsView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-06-26.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var viewModel = SettingsViewModel()
    
    let columns: [GridItem] = [
        GridItem(.fixed(120)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    
    var body: some View {
        VStack{
            Text("Settings")
                .padding(.top, 90)
                .font(.system(size: 30))
                .bold()
            
                VStack {
                    
                    
                    NavigationLink(destination: ChangeUserDataView()){
                        Text("Change Account Information")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                            .background(Color("CustomGreen"))
                            .cornerRadius(15)
                            .shadow(radius: 5)
                            .padding(.top, 100)
                            .padding(.bottom, 30)
                            .padding(.leading, 5)
                    }
                    
                    NavigationLink(destination: LoginView()){
                        Text("Log Out")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                            .background(Color("CustomGreen"))
                            .cornerRadius(15)
                            .shadow(radius: 5)
                            .padding(.top, 10)
                            .padding(.bottom, 30)
                            .padding(.leading, 5)
                    }
                }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color("CustomBackground"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
