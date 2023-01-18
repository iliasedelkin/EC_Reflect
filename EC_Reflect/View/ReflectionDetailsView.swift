//
//  ReflectionDetailsView.swift
//  EC_Reflect
//
//  Created by Ariuna Banzarkhanova on 13/01/23.
//

import SwiftUI

struct ReflectionDetailsView: View {
    @ObservedObject var reflection: Reflection
    
    var reflectionTitle: String
    
    init(reflection: Reflection) {
        self.reflection = reflection
        self.reflectionTitle = String(emojiFromFeeling(feeling: reflection.feeling))+" "+dateToString(date: reflection.date)
    }

    @Environment (\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationStack{
            VStack {
                Text(reflection.notes)
                        .font(.system(size: 25))
                        .multilineTextAlignment(.leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 19)
                            .foregroundColor(.white)
                            .shadow(radius: 5))
                Spacer()
            }
            .padding()
            .navigationTitle(reflectionTitle)
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
        ReflectionDetailsView(reflectionVM: ReflectionViewModel(), reflection: reflection1)
    }
}
