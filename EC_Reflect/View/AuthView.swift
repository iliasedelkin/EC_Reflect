//
//  AuthView.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 07/02/23.
//

import SwiftUI

@MainActor struct AuthView: View {
    
    @StateObject var authVM = AuthViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Group {
            switch authVM.authStatus {
            case .inProgress:
                AuthLoadingView(authVM: authVM)
            case .authorized:
                ContentView()
            case .failed(let error):
                VStack (spacing: 50){
                    Image("sad")
                    Text("Sorry, we could not \n authenticate you")
                        .font(.custom("Nunito-Regular", size: 30))
                        .foregroundColor(colorScheme == .light ? .black : .white)
                        .multilineTextAlignment(.center)
                    Button {
                        authVM.authStatus = .inProgress
                    } label: {
                        Text("Try Again")
                            .font(.custom("Nunito-Bold", size: 18))
                            .foregroundColor(colorScheme == .light ? .white : .black)
                            .padding(.init(top: 18, leading: 70, bottom: 18, trailing: 70))
                            .background(Color.accentColor)
                            .cornerRadius(50)
                        
                    }
                    .padding(.top, 10)
                    .padding(.leading, 16)
                    .onAppear(perform: {
                        print("DEBUG: Authorisation failed, error: \(error.localizedDescription)")
                    })
                }
            }
        }
        // Calling synchronous FaceID function when the device wakes from sleep mode
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            print("DEBUG: Sync FaceID activated")
            authVM.authenticateSync()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(authVM: AuthViewModel())
    }
}
