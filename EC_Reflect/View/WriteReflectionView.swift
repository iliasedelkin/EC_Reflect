//
//  WriteReflectionView.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 12/01/23.
//

import SwiftUI

struct WriteReflectionView: View {
    @ObservedObject var reflectionVM: ReflectionViewModel
    
    @State private var notesToAdd: String = ""
    @State private var feelingToAdd: Feeling = .unknown
    @State private var isEmojiSelected: Bool = false

    @Environment (\.dismiss) private var dismiss
    
    
    var background: some View {
        RoundedRectangle(cornerRadius: 10.0)
            .padding()
            .foregroundColor(Color("TextFieldColor"))
    }
    
    var body: some View {
        
        NavigationStack{
            VStack{
                ZStack (alignment: .topTrailing){
                    background
                    TextField("""
                              Share what made you feel good or bad
                              """, text: $notesToAdd, axis: .vertical)
                        .lineLimit(1...8)
                        .padding(.all, 30.0)
                }
                Spacer()
                VStack (spacing: 19){
                    Text("Overall, was the day good or bad?")
                        .font(.system(size: 18))
                        .fontWeight(.black)
                    HStack(spacing: 30){
                        EmojiButtonView(feelingToAdd: $feelingToAdd, feeling: .sad)
                        EmojiButtonView(feelingToAdd: $feelingToAdd, feeling: .neutral)
                        EmojiButtonView(feelingToAdd: $feelingToAdd, feeling: .happy)
                    }
                    .font(.system(size: 60))
                }
                .toolbar {
                    ToolbarItem (placement: .navigation){
                        Button{
                            dismiss()
                        } label: {
//                            Image(systemName: "chevron.backward")
                            Text("Cancel")
                        }
                    }
                    ToolbarItem(placement: .automatic){
                        Button("Save"){
       
                            reflectionVM.addNewReflectionNote(notes: notesToAdd, feeling: feelingToAdd)
                            dismiss()
                        }
                        .disabled(feelingToAdd == .unknown)
                    }
                }
                .navigationTitle("Reflect on your day")
            }
        }
    }
}

extension WriteReflectionView {
    
    struct EmojiButtonView: View {
        @Binding var feelingToAdd: Feeling
        
        var feeling: Feeling
        
        var body: some View {
            
            if feelingToAdd == feeling {
                Button(emojiFromFeeling(feeling: feeling)) {
                    
                }
            } else {
                Button(emojiFromFeeling(feeling: feeling)) {
                    feelingToAdd = feeling
                }
                .opacity(0.4)
            }
        }
    }
}

struct WriteReflectionView_Previews: PreviewProvider {
    static var previews: some View {
        
        WriteReflectionView(reflectionVM: ReflectionViewModel())
    }
}
