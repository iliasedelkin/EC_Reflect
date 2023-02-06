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
            ScrollView {
                VStack(alignment: .center, spacing: 30) {
                    HStack {
                    Text("Journal")
                        .font(.custom("Nunito-Bold", size: 36))
                        .padding(.top, 20)
                        Spacer()
                }
                    ForEach(reflectionVM.reflections.reversed()) { reflection in
                        NavigationLink {
                            ReflectionDetailsView(reflection: reflection)
                        } label: {
                          
                            NoteReflectionView(reflection: reflection)
                            
                        }.buttonStyle(.plain)
                    }
                }
                .padding(20)
            }
           
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView(reflectionVM: ReflectionViewModel())
    }
}
