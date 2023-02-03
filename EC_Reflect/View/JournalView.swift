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
        
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    ForEach(reflectionVM.reflections.reversed()) { reflection in
                        NavigationLink {
                            ReflectionDetailsView(addEditVM: AddEditViewModel(), reflection: reflection)
                        } label: {
                            NoteReflectionView(reflection: reflection)
                        }.buttonStyle(.plain)
                    }
                }
                .padding(20)
            }
            .navigationTitle("Journal")
            .onAppear{
                reflectionVM.fetchLearners()
            }
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView(reflectionVM: ReflectionViewModel())
    }
}
