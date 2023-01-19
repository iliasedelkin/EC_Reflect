//
//  SwiftUIView.swift
//  EC_Reflect
//
//  Created by Irina Deeva on 12/01/23.
//

import SwiftUI

struct JournalView: View {
    @ObservedObject var reflectionVM: ReflectionViewModel
    
    init(reflectionVM: ReflectionViewModel) {
        self.reflectionVM = reflectionVM
        
    }
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    //                    HStack{
                    //                        Text("Journal")
                    //                            .font(.system(size: 40).bold())
                    //                            .fontWeight(.black)
                    //                        Spacer()
                    //                    }
                    //                    .padding(.top, 40)
                    //                    .padding(.leading, 16)
                    
                    ForEach(reflectionVM.reflections.reversed()) { index in
                        
                        NavigationLink {
                            ReflectionDetailsView(reflectionVM: reflectionVM, reflection: index)
                        } label: {
                            NoteReflectionView(reflectionVM: ReflectionViewModel(), reflection: index)
                        }.buttonStyle(.plain)
                    }
                }
                .padding(20)
            }
            .navigationTitle("Journal")
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView(reflectionVM: ReflectionViewModel())
    }
}
