//
//  SwiftUIView.swift
//  EC_Reflect
//
//  Created by Irina Deeva on 12/01/23.
//

import SwiftUI

struct JournalView: View {
    @ObservedObject var reflectionVM: ReflectionViewModel
    
    var body: some View {
        
        ScrollView{
            VStack(spacing: 30){
                HStack{
                    Text("Journal")
                        .font(.system(size: 40).bold())
                        .fontWeight(.black)
                    Spacer()
                }
                .padding(.top, 40)
                .padding(.leading, 16)
                
                ForEach(reflectionVM.reflections) { index in
                    NoteReflectionView(reflectionVM: ReflectionViewModel(), reflection: index)
                }
            }
            
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView(reflectionVM: ReflectionViewModel())
    }
}
