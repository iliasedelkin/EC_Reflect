//
//  SwiftUIView.swift
//  EC_Reflect
//
//  Created by Irina Deeva on 11/01/23.
//

import SwiftUI

struct NoteReflectionView: View {
    var date = "10 January, 2023"
    var notes = "Today the crazy old lady watched TV loud again. But we made a prototype for Challenge."
    var emoji = "😀"
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)){
            RoundedRectangle(cornerRadius: 19.0)
                .fill(.white)
                .frame(width: 333, height: 141)
                .shadow(radius: 15, x: 0, y: 0)
                .opacity(0.5)
            
            VStack(alignment: .leading, spacing: 15){
                Text(date).font(.system(size: 16, weight: .bold))
                    .opacity(0.5)
                Text(notes).font(.system(size: 16, weight: .regular))
                    .frame(width: 250, height: 58)
            }
            .padding()
            
            Text(emoji).font(.system(size: 60, weight: .regular))
                .frame(maxWidth: 320, maxHeight: 141, alignment: .bottomTrailing)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NoteReflectionView()
    }
}
