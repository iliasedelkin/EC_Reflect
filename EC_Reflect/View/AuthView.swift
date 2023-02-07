//
//  AuthView.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 07/02/23.
//

import SwiftUI

@MainActor struct AuthView: View {
    
    @ObservedObject var profileVM = ProfileViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            if profileVM.isUnlocked {
                ContentView(profileVM: profileVM)
            } else {
                if profileVM.failedIdentification {
                    VStack {
                        Text("Sorry, we failed \n to authenticate you 😢")
                            .font(.custom("Nunito-Regular", size: 30))
                            .foregroundColor(colorScheme == .light ? .black : .white)
                            .multilineTextAlignment(.center)
                        Button {
                            do { profileVM.authenticate() }
                        } label: {
                            Text("Try Again")
                                .font(.custom("Nunito-Bold", size: 18))
                                .foregroundColor(.white)
            
                                .padding(.init(top: 18, leading: 70, bottom: 18, trailing: 70))
                                .background(Color.accentColor)
                                .cornerRadius(50)
            
                        }
                        .padding(.top, 10)
                        .padding(.leading, 16)
                    }
                } else {
                    ProgressView()
                }
            }
        }
        .onAppear(perform: profileVM.authenticate)
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
