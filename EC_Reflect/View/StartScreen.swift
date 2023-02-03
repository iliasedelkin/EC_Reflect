//
//  StartScreen.swift
//  EC_Reflect
//
//  Created by Alexey on 12/01/23.
//

import SwiftUI

struct StartScreen: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var reflectionVM: ReflectionViewModel
    @ObservedObject var profileVM: ProfileViewModel

    var title = "Today"

    var body: some View {
        ZStack {
            Color ("bg-color").edgesIgnoringSafeArea(.all)
        VStack (alignment: .leading) {
            VStack (alignment: .leading) {
                
                
                Text("Today")
                    .font(.custom("Nunito-Bold", size: 36))
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Text(dateToString(date: Date()))
                    .font(.custom("Nunito-Bold", size: 18))
                    
                    .fontWeight(.regular)
            }
            .offset(y: -10)
          
            VStack (alignment: .center){
                StartscreenCardView(reflectionVM: reflectionVM)
                    .offset(y: 0)
                
                
                QuoteView(quoteVM: QuoteViewModel())
                    .offset(y: -15)
                
            }
        }
        
    }
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
    
        StartScreen(reflectionVM: ReflectionViewModel(), profileVM: ProfileViewModel())
    }
}
