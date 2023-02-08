//
//  EmptyJournalView.swift
//  EC_Reflect
//
//  Created by Ariuna Banzarkhanova on 08/02/23.
//

import SwiftUI

struct EmptyJournalView: View {
    var body: some View {
        VStack(spacing: 50){
//            Spacer()
            Image("writeNote")
            Text("""
There is nothing in journal yet.
Write your first reflection
""")
            .font(.custom("Nunito-Bold", size: 20))
            .multilineTextAlignment(.center)
            .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.7254901960784313, green: 0.7294117647058823, blue: 0.7294117647058823)/*@END_MENU_TOKEN@*/)
        }
    }
}

struct EmptyJournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
        EmptyJournalView()
    }
}
