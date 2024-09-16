//
//  WelcomeView.swift
//  EC_Reflect
//
//  Created by Alexey on 24/01/23.
//

import SwiftUI

struct WelcomeView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var welcomeScreenShown = UserDefaults.standard.welcomeScreenShown
    @State var isFaceIdOn = UserDefaults.standard.isFaceIdOn
    
    var body: some View {
        
        if welcomeScreenShown {
            if isFaceIdOn {
                AuthView()
            } else {
                ContentView(profileVM: ProfileViewModel())
            }
        } else {
            ZStack {
                Color ("bg-color").edgesIgnoringSafeArea(.all)
                VStack (){
                    VStack (spacing: 10){
                        Image("emotions")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 350)
                            
                        Text("Reflect")

                            .font(.custom("Nunito-Regular", size: 44))
                            .foregroundColor(colorScheme == .light ? .black : .white)
                            .padding(.top, 30)
                        
                   
                        
                        Text("Track your mind")
                            .font(.custom("Nunito-Regular", size: 20))
                            .foregroundColor(colorScheme == .light ? .black : .white)
                            .padding(.bottom, 70)
                    }
                  
                    Button {
                        UserDefaults.standard.isFaceIdOn = true
                        UserDefaults.standard.welcomeScreenShown = true
                        welcomeScreenShown = true
                        print("DEBUG: FaceID turned on")
    //                    profileVM.login()
                        
                    } label: {
                        ZStack {
                            RoundedRectangle (cornerRadius: 50)
                                   .frame(width: 240, height: 60)
                                   .foregroundColor(colorScheme == .light ? .accentColor : .white)
                        Text("Turn on FaceID")
                                .font(.custom("Nunito-Bold", size: 18))
                        
                            .foregroundColor(colorScheme == .light ? .white : .black)
                        
                        
                            .cornerRadius(50)
                    }
                    }
                    Button {
                        UserDefaults.standard.welcomeScreenShown = true
                        welcomeScreenShown = true
                        print("DEBUG: Continue without FaceID")
    //                    profileVM.isAuthenticated = true
                    } label: {
                        Text("Skip for now")
                            .font(.custom("Nunito-Bold", size: 20))
                    
                            .foregroundColor(colorScheme == .light ? .black : .white)
                    }
                    .padding(.top, 10)
                    
                }
            }
        }
    }
    
    struct WelcomeView_Previews: PreviewProvider {
        static var previews: some View {
            WelcomeView()
        }
    }
}
