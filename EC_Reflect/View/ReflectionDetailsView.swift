//
//  ReflectionDetailsView.swift
//  EC_Reflect
//
//  Created by Ariuna Banzarkhanova on 13/01/23.
//

import SwiftUI

struct ReflectionDetailsView: View {
    @ObservedObject var addEditVM: AddEditViewModel
    
    var reflection: ReflectionNote
    
    @State var isEdit = false
    
    @Environment (\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationStack{
            VStack {

                HStack {
                    Text(dateToString(date: reflection.date!))
                        .font(.custom("Nunito-Bold", size: 36))
                        .padding(.top, 10)
              Spacer()
                }
                HStack {
                    Text(reflection.notes!)
                        .font(.custom("Nunito-Regular", size: 26))
                        .multilineTextAlignment(.leading)
                        .padding(.top, 10)
                    Spacer()
                }

                Spacer()
           Text((emojiFromFeeling(feeling: Feeling(rawValue: reflection.feeling!)!)))
                    .font(.system(size: 150))
                    .padding(.bottom, 60)
            }
            .padding()

            .navigationTitle(String(emojiFromFeeling(feeling: Feeling(rawValue: reflection.feeling!)!))+" "+dateToString(date: reflection.date!))
            .sheet(isPresented: $isEdit){
                WriteReflectionView(addEditVM: addEditVM, addReflection: $isEdit)
            }
            .toolbar{
                ToolbarItem(placement: .destructiveAction) {
                    Button(action: {
                        addEditVM.notes = reflection.notes ?? ""
                        addEditVM.feeling = Feeling(rawValue: reflection.feeling!)!
                        addEditVM.reflection = reflection
                        isEdit.toggle()
                    }, label: {
                        Text("Edit")
                    })
                }
            }

        }
        
    }
}

//struct ReflectionDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReflectionDetailsView(reflection: ReflectionNote())
//    }
//}
