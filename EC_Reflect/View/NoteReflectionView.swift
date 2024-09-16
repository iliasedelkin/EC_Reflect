//
//  SwiftUIView.swift
//  EC_Reflect
//
//  Created by Irina Deeva on 11/01/23.
//

import SwiftUI

struct NoteReflectionView: View {
    @ObservedObject var reflection: ReflectionNote
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack{
            Color ("bg-color").edgesIgnoringSafeArea(.all)
            HStack {
                if let feeling = Feeling(rawValue: reflection.feeling ?? "") {
                  emojiFromFeeling(feeling: feeling)
                        .resizable()
                        .frame(width: 60, height: 60)
                 
                }
            
            VStack(alignment: .leading, spacing: 15){
                
                if let date = reflection.date, let notes = reflection.notes{
                    Text(dateToString(date: date))
                        .font(.custom("Nunito-Bold", size: 20))
                        .foregroundColor(colorScheme == .light ? .black : .white)
                    Text(notes)
                        .font(.custom("Nunito-Regular", size: 16))
                        .foregroundColor(colorScheme == .light ? .black : .white)
                        .lineLimit(2)
                }
            }
            .padding()
            Spacer()
            
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
