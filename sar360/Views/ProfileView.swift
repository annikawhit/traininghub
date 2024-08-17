//
//  ProfileView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-08-17.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Spacer()
                    
                    NavigationLink(destination: SettingsView()){
                        Image(systemName: "gearshape")
                            .foregroundColor(.black)
                            .font(.system(size: 30))
                            .padding(.top, 20)
                            .padding(.trailing, 30)
                    }
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("CustomBackground"))
            .navigationTitle("name")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
