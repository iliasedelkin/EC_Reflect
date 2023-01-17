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
                
                NoteReflectionView(reflectionVM: ReflectionViewModel( reflection: reflection1))
                NoteReflectionView(reflectionVM: ReflectionViewModel( reflection: reflection2))
                NoteReflectionView(reflectionVM: ReflectionViewModel( reflection: reflection3))
                NoteReflectionView(reflectionVM: ReflectionViewModel( reflection: reflection4))
                
            }
            
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
