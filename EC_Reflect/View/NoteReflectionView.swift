//
//  SwiftUIView.swift
//  EC_Reflect
//
//  Created by Irina Deeva on 11/01/23.
//

import SwiftUI

struct NoteReflectionView: View {
    @ObservedObject var reflection: ReflectionNote
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)){
            RoundedRectangle(cornerRadius: 19.0)
                .stroke(.black)
                
                .frame(width: 333, height: 141)
                
            
            VStack(alignment: .leading, spacing: 15){
                if let date = reflection.date, let notes = reflection.notes{
                    Text(dateToString(date: date))
                        .font(.custom("Nunito-Bold", size: 16))
                      
                    Text(notes)
                        .font(.custom("Nunito-Regular", size: 16))
                        .frame(width: 250, height: 58)
                }
            }
            .padding()
            
            if let feeling = Feeling(rawValue: reflection.feeling!) {
                Text(emojiFromFeeling(feeling: feeling))
                    .font(.system(size: 30, weight: .regular))
                    .frame(maxWidth: 310, maxHeight: 130, alignment: .topTrailing)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
//        NoteReflectionView(reflectionVM: ReflectionViewModel(), reflection: reflection)
        JournalView(reflectionVM: ReflectionViewModel())
    }
}
