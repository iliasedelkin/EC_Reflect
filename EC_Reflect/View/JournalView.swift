//
//  SwiftUIView.swift
//  EC_Reflect
//
//  Created by Irina Deeva on 12/01/23.
//

import SwiftUI

struct JournalView: View {
    @ObservedObject var reflectionVM: ReflectionViewModel = ReflectionViewModel()
    
    var body: some View {
        
        NavigationStack {
//            ScrollView {
                VStack(alignment: .center, spacing: 30) {
                    HStack {
                    Text("Journal")
                        .font(.custom("Nunito-Bold", size: 36))
                        .padding(.top, 20)
                        Spacer()
                }
                    List {
                        ForEach(reflectionVM.reflections.reversed()) { reflection in
                            NavigationLink (destination: ReflectionDetailsView(addEditVM: AddEditViewModel(), reflection: reflection)) {
                                
                            NoteReflectionView(reflection: reflection)
                                
                            }
                            .buttonStyle(.plain)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button(role: .destructive) {
                                    withAnimation {
                                        reflectionVM.deleteReflection(reflection: reflection)
                                    }
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                        .onDelete(perform: reflectionVM.deleteRefOffset)
                    }
                    .listStyle(.inset)
                }
                .padding(20)
//            }

            .onAppear{
                reflectionVM.fetchReflections()
            }

        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView(reflectionVM: ReflectionViewModel())
    }
}
