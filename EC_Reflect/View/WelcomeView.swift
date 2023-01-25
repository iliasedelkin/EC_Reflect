//
//  WelcomeView.swift
//  EC_Reflect
//
//  Created by Alexey on 24/01/23.
//

import SwiftUI

struct WelcomeView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var welcomeVM: WelcomeViewModel
    
    var body: some View {
        ZStack {
            Color ("bg-color").edgesIgnoringSafeArea(.all)
            VStack (){
                VStack (spacing: 40){
                    Text("Reflect")
                        .font(.custom("Nunito-Regular", size: 50))
                        .foregroundColor(colorScheme == .light ? .black : .white)
                    
                    
                    Image("emotions")
                    
                    Text("Track your mind")
                        .font(.custom("Nunito-Regular", size: 24))
                        .foregroundColor(colorScheme == .light ? .black : .white)
                        .padding(.bottom, 40)
                }
                .padding(.bottom, 10)
                Button {
                    print("Sign up")
                    welcomeVM.login()
                    
                } label: {
                    Text("Sign up")
                        .font(.custom("Nunito-Bold", size: 20))
                        .foregroundColor(.white)
                        .frame(width: 260, height: 60)
                        .background(Color.accentColor)
                    
                        .cornerRadius(50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50).stroke(Color.black, lineWidth: 1)
                        )
                }
                Button {
                    print("Skip for now")
                } label: {
                    Text("Skip for now")
                        .font(.custom("Nunito-Bold", size: 20))
                        .foregroundColor(colorScheme == .light ? .black : .white)
                }
                .padding(.top, 10)
                
            }
        }
    }
    
    struct WelcomeView_Previews: PreviewProvider {
        static var previews: some View {
            WelcomeView(welcomeVM: WelcomeViewModel())
        }
    }
}
