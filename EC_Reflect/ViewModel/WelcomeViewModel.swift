//
//  WelcomeViewModel.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 24/01/23.
//

import Foundation
import Auth0

class WelcomeViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    
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
              print("Credentials: \(credentials)")
              print("ID token: \(credentials.idToken)")
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
            }
          }
      }
    
    
}
