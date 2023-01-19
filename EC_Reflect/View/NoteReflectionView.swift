//
//  SwiftUIView.swift
//  EC_Reflect
//
//  Created by Irina Deeva on 11/01/23.
//

import SwiftUI

struct NoteReflectionView: View {
    @ObservedObject var reflectionVM: ReflectionViewModel
    @State var reflection: Reflection
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)){
            RoundedRectangle(cornerRadius: 19.0)
                .fill(.white)
                .frame(width: 333, height: 141)
                .shadow(radius: 15, x: 0, y: 0)
                .opacity(0.5)
            
            VStack(alignment: .leading, spacing: 15){
                Text(dateToString(date: reflection.date)).font(.system(size: 16, weight: .bold))
                    .opacity(0.5)
                Text(reflection.notes).font(.system(size: 16, weight: .regular))
                    .frame(width: 250, height: 58)
            }
            .padding()
            
            Text(emojiFromFeeling(feeling: reflection.feeling)).font(.system(size: 60, weight: .regular))
                .frame(maxWidth: 320, maxHeight: 141, alignment: .bottomTrailing)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NoteReflectionView(reflectionVM: ReflectionViewModel(), reflection: reflection1)
    }
}
