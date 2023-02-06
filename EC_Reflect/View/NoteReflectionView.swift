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
                    
                    Text(notes)
                        .font(.custom("Nunito-Regular", size: 16))
                        .lineLimit(2)
                }
            }
            .padding()
            Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
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
