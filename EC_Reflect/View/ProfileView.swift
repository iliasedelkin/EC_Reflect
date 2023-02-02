//
//  SettingsView.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 25/01/23.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var profileVM: ProfileViewModel
    
    var body: some View {
        
        VStack {
            Text(profileVM.userProfile.name)
            Text(profileVM.userProfile.id)
            Text(profileVM.userProfile.email)
            Text(profileVM.userProfile.emailVerified)
            Text(profileVM.userProfile.picture)
            Text(profileVM.userProfile.updatedAt)
            Button {
                print("Log out")
                profileVM.logout()
                
            } label: {
                Text("Log out")
                    .font(.custom("Nunito-Bold", size: 18))
                    .foregroundColor(.white)
                
                    .padding(.init(top: 18, leading: 65, bottom: 18, trailing: 65))
                    .background(Color.accentColor)
                
                    .cornerRadius(50)
                  
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profileVM: ProfileViewModel())
    }
}
