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
                
                HStack (alignment: .center){
                    Text(dateToString(date: reflection.date!))
                        .font(.custom("Nunito-Bold", size: 34))
                        .padding(.top, 10)
                 (emojiFromFeeling(feeling: Feeling(rawValue: reflection.feeling!)!))
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding(.leading, 20)
                    
                    Spacer()
                }
                ScrollView() {
                HStack {
                    Text(reflection.notes!)
                        .font(.custom("Nunito-Regular", size: 20))
                        .multilineTextAlignment(.leading)
                        .padding(.top, 10)
                    Spacer()
                }
            }
                Spacer()

            }
            .padding()

        
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
