//
//  ReflectionDetailsView.swift
//  EC_Reflect
//
//  Created by Ariuna Banzarkhanova on 13/01/23.
//

import SwiftUI

struct ReflectionDetailsView: View {
    
    var reflection: ReflectionNote
    
    @State var editReflect = false

    @Environment (\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationStack{
            VStack {
                Text(reflection.notes ?? "")
                        .font(.system(size: 25))
                        .multilineTextAlignment(.leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 19)
                            .foregroundColor(.white)
                            .shadow(radius: 5))
                Spacer()
            }
            .padding()
            .navigationTitle(String(emojiFromFeeling(feeling: Feeling(rawValue: reflection.feeling ?? "") ?? .unknown))+" "+dateToString(date: reflection.date ?? Date()))
            .toolbar{
                ToolbarItem(placement: .destructiveAction) {
                    Button ("Edit"){
                        editReflect.toggle()
                    }
                }
            }
            .sheet(isPresented: $editReflect) {
                WriteReflectionView(reflectionVM: ReflectionViewModel(), reflection: reflection)
            }
        }

    }
}
//
//struct ReflectionDetailsView_Previews: PreviewProvider {
//    var reflectionNote: ReflectionNote {
//        let context = PersistenceManager.shared.container.viewContext
//        let note = ReflectionNote(context: context)
//        note.notes = "New note"
//        note.feeling = Feeling.sad.rawValue
//        
//        return note
//    }
//    
//    static var previews: some View {
//        ReflectionDetailsView(reflection: reflectionNote)
//    }
//}

