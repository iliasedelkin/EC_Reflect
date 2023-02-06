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
                if let feeling = Feeling(rawValue: reflection.feeling!) {
                    Text(emojiFromFeeling(feeling: feeling))
                        .font(.system(size: 50, weight: .regular))
                    Divider()
                        .frame(minWidth: 1)
                        .background(Color.black)
                      
                    
                }
            
            VStack(alignment: .leading, spacing: 15){
                
                if let date = reflection.date, let notes = reflection.notes{
                    Text(dateToString(date: date))
                        .font(.custom("Nunito-Bold", size: 20))
                    
                    Text(notes)
                        .font(.custom("Nunito-Regular", size: 16))
                        
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
