//
//  ReflectionDetailsView.swift
//  EC_Reflect
//
//  Created by Ariuna Banzarkhanova on 13/01/23.
//

import SwiftUI

struct ReflectionDetailsView: View {
    @ObservedObject var reflectionVM: ReflectionViewModel
    
    var titleReflection: String
    
    init(reflectionVM: ReflectionViewModel) {
        self.reflectionVM = reflectionVM
        self.titleReflection = reflectionVM.reflection.emoji+" "+reflectionVM.reflection.date
    }
    
    @Environment (\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            VStack {
                Text(reflectionVM.reflection.notes)
                        .font(.system(size: 25))
                        .multilineTextAlignment(.leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 19)
                            .foregroundColor(.white)
                            .shadow(radius: 5))
                Spacer()
            }
            .padding()
            .navigationTitle(titleReflection)
            .toolbar {
                ToolbarItem (placement: .navigation){
                    Button{
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                        Text("Back")
                    }
                }
            }
        }
    }
}

struct ReflectionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ReflectionDetailsView(reflectionVM: ReflectionViewModel(reflection: Reflection(id: 1, date: "10 January 2023", notes: "Misha Huisha fhhskfhkshkhfkshjhfkhfkfhskhfshkssdjhdkhsdhkskdkshkdhksdkhhkhkshfkhsfh", emoji: "😐")))
    }
}
