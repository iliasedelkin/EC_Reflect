//
//  ReflectionDetailsView.swift
//  EC_Reflect
//
//  Created by Ariuna Banzarkhanova on 13/01/23.
//

import SwiftUI

struct ReflectionDetailsView: View {
    @ObservedObject var reflectionVM: ReflectionViewModel
    
    @State var reflection: Reflection

    @Environment (\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationStack{
            VStack {
                Text(reflection.notes)
                        .font(.system(size: 25))
                        .multilineTextAlignment(.leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 19)
                            .foregroundColor(.white)
                            .shadow(radius: 5))
                Spacer()
            }
            .padding()
            .navigationTitle(String(emojiFromFeeling(feeling: reflection.feeling))+" "+dateToString(date: reflection.date))
        }

    }
}

struct ReflectionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ReflectionDetailsView(reflectionVM: ReflectionViewModel(), reflection: reflection1)
    }
}
