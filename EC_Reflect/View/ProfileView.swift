//
//  SettingsView.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 25/01/23.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var profileVM: ProfileViewModel
    @State var isNotificationOn: Bool = false
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        VStack (spacing: 30) {
            Text("Notifications")
                .font(.custom("Nunito-Regular", size: 35))
                .foregroundColor(colorScheme == .light ? .black : .white)
            Toggle("Turn notifications on", isOn: $isNotificationOn)
            
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
                    .font(.custom("Nunito-Bold", size: 20))
                    .foregroundColor(.white)
                    .frame(width: 260, height: 60)
                    .background(Color.accentColor)
                
                    .cornerRadius(50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50).stroke(Color.black, lineWidth: 1)
                    )
            }
            .padding(.top, 10)
            .padding(.leading, 16)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profileVM: ProfileViewModel(), isNotificationOn: false)
    }
    
}
