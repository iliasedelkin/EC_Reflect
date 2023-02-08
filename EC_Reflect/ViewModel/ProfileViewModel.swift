//
//  ProfileViewModel.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 24/01/23.
//

import Foundation
import Auth0
import UserNotifications

@MainActor
class ProfileViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var userProfile: Profile = Profile.empty
    @Published var isNotifAuthGiven: Bool = UserDefaults.standard.bool(forKey: "isNotifAuthGiven")
    @Published var notificationTime: Date = UserDefaults.standard.object(forKey: "notificationTime") as? Date ?? Date()
    @Published var isNotificationOn: Bool = UserDefaults.standard.bool(forKey: "isNotificationOn")
    @Published var dayTrackingMode: DayTrackingMode = DayTrackingMode.total
    
    let weekdaysForNotification: [Int] = [1, 2, 3, 4, 5, 6, 7]
    
    func login() {
        Auth0 // 1
            .webAuth() // 2
            .start { result in // 3
                switch result {
                    // 4
                case .failure(let error):
                    print("Failed with: \(error)")
                    // 5
                case .success(let credentials):
                    self.isAuthenticated = true
                    self.userProfile = Profile.from(credentials.idToken)
                    
                    //              print("Credentials: \(credentials)")
                    //              print("ID token: \(credentials.idToken)")
                }
            }
    }
    
    func logout() {
        Auth0 // 1
            .webAuth() // 2
            .clearSession { result in // 3
                switch result {
                    // 4
                case .failure(let error):
                    print("Failed with: \(error)")
                    // 5
                case .success:
                    self.isAuthenticated = false
                    self.userProfile = Profile.empty
                }
            }
    }
    
//    Handling notifications
    
    func requestNotifPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                self.isNotifAuthGiven = true
                self.saveNotifAuthStatus()
                
                print("DEBUG: Permissions provided")
                
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func addDailyNotifications(daysArray: [Int]) {
        
        for number in daysArray {
            
            let content = UNMutableNotificationContent()
            content.title = "Time for your daily reflection! 🧠❤️"
            content.subtitle = "Take 5 minutes to record your thoughts and feelings"
            content.sound = UNNotificationSound.default
            
            // Set the Days&time, iterate for every day of the week
            var dateComponents = DateComponents()
            dateComponents.weekday = number
            dateComponents.hour = Calendar.current.component(.hour, from: notificationTime)
            dateComponents.minute = Calendar.current.component(.minute, from: notificationTime)
            
            print(dateComponents)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            
            // choose a random identifier
            let uuidString = UUID().uuidString
            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
            
            // add our notification request
            let notificationCenter = UNUserNotificationCenter.current()
            notificationCenter.add(request) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
            
//            saveNotificationUUID(notificationUuidString: uuidString)
            self.saveNotifTime()
            self.saveNotificationStatus()
            
            print("DEBUG: Notification set for \(trigger.dateComponents.hour!):  \(trigger.dateComponents.minute!)")
        }
        
    }
    
    func removeDailyNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        self.saveNotifTime()
        self.saveNotificationStatus()
        
        print("DEBUG: Notifications removed")
    }
    
    func saveNotificationStatus() {
        UserDefaults.standard.set(isNotificationOn, forKey: "isNotificationOn")
    }
    
//    func saveNotificationUUID(notificationUuidString: String) {
//        UserDefaults.standard.set(notificationUuidString, forKey: "notificationUuidString")
//    }
    
    func saveNotifAuthStatus() {
        UserDefaults.standard.set(isNotifAuthGiven, forKey: "isNotifAuthGiven")
    }
    func saveNotifTime() {
        UserDefaults.standard.set(notificationTime, forKey: "notificationTime")
    }
    
}
