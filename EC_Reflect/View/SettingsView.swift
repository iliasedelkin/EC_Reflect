//
//  SettingsView.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 25/01/23.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var welcomeVM: WelcomeViewModel
    
    var body: some View {
        Button {
            print("Log out")
            welcomeVM.logout()
            
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
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(welcomeVM: WelcomeViewModel())
    }
}
