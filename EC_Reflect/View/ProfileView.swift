//
//  SettingsView.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 25/01/23.
//

import SwiftUI
import UserNotifications

struct ProfileView: View {
    @ObservedObject var profileVM: ProfileViewModel
    
    //    @State var notificationTime: Date = Date()
//    @State var isNotificationOn: Bool = UserDefaults.standard.bool(forKey: "isNotificationOn")
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        
        VStack (spacing: 30) {
            
            Text("Notifications")
                .font(.custom("Nunito-Regular", size: 35))
                .foregroundColor(colorScheme == .light ? .black : .white)
            
            if !profileVM.isNotifAuthGiven {
                Button {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("Permissions provided")
                            profileVM.isNotifAuthGiven = true
                            profileVM.saveNotifAuthStatus()
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                } label: {
                    Text("Provide permissions")
                }
            } else {
                DatePicker("Daily notification time", selection: $profileVM.notificationTime, displayedComponents: .hourAndMinute)
                    .onChange(of: profileVM.notificationTime) { _ in
                        if profileVM.isNotificationOn {
                            profileVM.addDailyNotifications(daysArray: profileVM.weekdaysForNotification)
                        }
                    }
                
                Toggle(isOn: $profileVM.isNotificationOn) {
                    Text("Turn daily notifications on")
                }.onChange(of: profileVM.isNotificationOn) { value in
                    if profileVM.isNotificationOn {
                        profileVM.addDailyNotifications(daysArray: profileVM.weekdaysForNotification)
                        profileVM.saveNotificationStatus()
                    } else {
                        print("notifications off")
                        profileVM.removeNotifications()
                    }
                }
            }
                
                //            Text(profileVM.userProfile.name)
                //            Text(profileVM.userProfile.id)
                //            Text(profileVM.userProfile.email)
                //            Text(profileVM.userProfile.emailVerified)
                //            Text(profileVM.userProfile.picture)
                //            Text(profileVM.userProfile.updatedAt)
            
            Text("Profile")
                .font(.custom("Nunito-Regular", size: 35))
                .foregroundColor(colorScheme == .light ? .black : .white)
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
        .padding()
    }
}

//extension ProfileView {
//    func requestPermissions(){
//
//    }
//}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profileVM: ProfileViewModel())
    }
    
}
