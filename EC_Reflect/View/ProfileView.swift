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

    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        
        VStack (spacing: 30) {
            HStack {
                Text("Settings")
                    .font(.custom("Nunito-Bold", size: 36))
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .padding(.top, 20)
                Spacer()
            }
            
            
            HStack {
                Text("Statistics")
                    .font(.custom("Nunito-Regular", size: 20))
                    .foregroundColor(colorScheme == .light ? .black : .white)
                Spacer()
            }
            
            HStack(){
                Text("Day tracking mode: ")
                Picker("Day tracking mode", selection: $profileVM.dayTrackingMode) {
                    ForEach(DayTrackingMode.allCases, id: \.self) { dayTrackingMode in
                        
                        Text(dayTrackingMode.rawValue).tag(dayTrackingMode)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            HStack {
                Text("Notifications")
                    .font(.custom("Nunito-Regular", size: 20))
                    .foregroundColor(colorScheme == .light ? .black : .white)
                Spacer()
            }
            
            //Asking for authorisation to show notifications
            if !profileVM.isNotifAuthGiven {
                Button {
                    profileVM.requestNotifPermission()
                } label: {
                    Text("Provide permissions")
                }
                
            //Showing notification controls
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
                        
                    } else {
                        profileVM.removeDailyNotifications()
                        
                    }
                }
            }
            
           
            
            
            
                
            Button {
                print("Log out")
                profileVM.logout()
            } label: {
                Text("Log out")
                    .font(.custom("Nunito-Bold", size: 18))
                    .foregroundColor(.white)
                
                    .padding(.init(top: 18, leading: 70, bottom: 18, trailing: 70))
                    .background(Color.accentColor)
                    .cornerRadius(50)
                  
            }
            .padding(.top, 10)
            .padding(.leading, 16)
            Spacer()
        }
        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profileVM: ProfileViewModel())
    }
    
}
