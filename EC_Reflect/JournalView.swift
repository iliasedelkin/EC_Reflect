//
//  SwiftUIView.swift
//  EC_Reflect
//
//  Created by Irina Deeva on 12/01/23.
//

import SwiftUI

struct JournalView: View {
    
    var body: some View {
        
        ScrollView{
            VStack(spacing: 30){
                
                HStack{
                    Text("Journal")
                        .font(.system(size: 40).bold())
                        .fontWeight(.light)
                    Spacer()
                }
                .padding(.top, 40)
                .padding(.leading, 16)
                
                NoteReflectionView(date: "13 January 2023",
                                   notes: "I love my classmates, they are so nice ... I hope we meet on the weekend.",
                                   emoji:"😀")
                NoteReflectionView(date: "12 January 2023",
                                   notes: "Today the weather is not good, but luckily I took my umbrella. I hate rain.",
                                   emoji:"😐")
                NoteReflectionView(date: "11 January 2023",
                                   notes: "I am  so tired, I should have gone to bed earlier. Deprivation of sleeping is the worst thing.",
                                   emoji:"😫")
                NoteReflectionView(date: "10 January 2023",
                                   notes: "Today the crazy old lady watched TV loud again. But we made a prototype for Challenge.",
                                   emoji:"😀")
                
            }
            
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
