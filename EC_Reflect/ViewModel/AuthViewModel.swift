//
//  AuthViewModel.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 08/02/23.
//

import Foundation
import LocalAuthentication

// Local Authentication

@MainActor
class AuthViewModel: ObservableObject {
    
    
    @Published var authStatus = AuthStatus.inProgress
    
    // Async FaceID function
    func authenticate() async {
        print("DEBUG: auth start – \(authStatus)")
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "We need to unlock the app"
            do {
                self.authStatus = await withCheckedContinuation { continuation in
                    context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authError in
                        if success {
                            //  self.authStatus = .authorized
                            continuation.resume(returning: AuthStatus.authorized)
                            print("DEBUG: App Unlocked")
                        } else {
                            // self.authStatus = .failed(authError!)
                            continuation.resume(returning: AuthStatus.failed(authError!))
                            print("DEBUG: FaceID Failed")
                        }
                      
                    }
                }
                print("DEBUG: auth closure – \(self.authStatus)")
            }
        } else {
            self.authStatus = .failed(error!)
        }
        print("DEBUG: auth end – \(authStatus)")
    }
    
    //Sync FaceID function
    func authenticateSync() {
        let context = LAContext()
        var error: NSError? = nil
        let canEvaluate = context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error)

        if canEvaluate {
            if context.biometryType != .none {
                context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "To access your data") { (success, error) in
                    DispatchQueue.main.async {
                        if success {
                            self.authStatus = .authorized
                        } else {
                            self.authStatus = .failed(error!)
                        }
                    }
                }
            }
        }
    }
    
}

//    enum AuthError <T, E>{
//        case noBiometrics(T)
//        case otherError(E)
//    }


//    func authenticate1() async {
//        do {
//            print("DEBUG: start – \(authStatus)")
//
//            let context = LAContext()
//            var error: NSError?
//
//            // check whether biometric authentication is possible
//            if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
//                // it's possible, so go ahead and use it
//                let reason = "We need to unlock your data."
//
//                try context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
//                    // authentication has now completed
//                    if success {
//                        self.authStatus = .authorized
//                        print("DEBUG: App Unlocked")
//                    } else {
//                        self.authStatus = .failed
//                        print("DEBUG: FaceID Failed")
//                    }
//                    print("DEBUG: closure – \(self.authStatus)")
//                }
//            } else {
//                throw error!
//            }
//            print("DEBUG: end – \(authStatus)")
//    }
//}

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
