//
//  ProfileViewModel.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 24/01/23.
//

import Foundation
import Auth0
import UserNotifications
import LocalAuthentication

@MainActor
class ProfileViewModel: ObservableObject {
    
    @Published var isAuthenticated: Bool = false
    @Published var userProfile: Profile = Profile.empty
    
    @Published var isNotifAuthGiven: Bool = UserDefaults.standard.bool(forKey: "isNotifAuthGiven")
    @Published var notificationTime: Date = UserDefaults.standard.object(forKey: "notificationTime") as? Date ?? Date()
    @Published var isNotificationOn: Bool = UserDefaults.standard.bool(forKey: "isNotificationOn")
    
//    @Published var welcomeScreenShown: Bool = UserDefaults.standard.bool(forKey: "isWelcomeScreenShown")
//    @Published var isFaceIdOn: Bool = UserDefaults.standard.bool(forKey: "isFaceIdOn")
    @Published var isUnlocked = false
    @Published var failedIdentification = false
    

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
}
    


//    Handling notifications
    
extension ProfileViewModel {
    
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
            
            print("DEBUG: Notification set for day \(number) at \(trigger.dateComponents.hour!):\(trigger.dateComponents.minute!)")
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
    
    func saveNotifAuthStatus() {
        UserDefaults.standard.set(isNotifAuthGiven, forKey: "isNotifAuthGiven")
    }
    func saveNotifTime() {
        UserDefaults.standard.set(notificationTime, forKey: "notificationTime")
    }
    
    //    func saveNotificationUUID(notificationUuidString: String) {
    //        UserDefaults.standard.set(notificationUuidString, forKey: "notificationUuidString")
    //    }
    
}

// Local Authentication

extension ProfileViewModel {
    
    func authenticate() {
        
        let context = LAContext()
        var error: NSError?
        
    // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    self.isUnlocked = true
                    print("DEBUG: App Unlocked")
                } else {
                    self.failedIdentification = true
                    print("DEBUG: FaceID Failed")
                }
            }
        } else {
            // no biometrics
        }
    }
}

extension UserDefaults {
    var welcomeScreenShown: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "welcomeScreenShown") as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "welcomeScreenShown")
        }
    }
    
    var isFaceIdOn: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "isFaceIdOn") as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "isFaceIdOn")
        }
    }
}
