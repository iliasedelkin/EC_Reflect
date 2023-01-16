//
//  WriteReflectionView.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 12/01/23.
//

import SwiftUI

struct WriteReflectionView: View {
    @State private var reflection: String = ""
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
                              """, text: $reflection, axis: .vertical)
                        .lineLimit(1...8)
                        .padding(.all, 30.0)
                }
                Spacer()
                VStack (spacing: 19){
                    Text("Overall, was the day good or bad?")
                        .font(.system(size: 18))
                        .fontWeight(.black)
                    HStack(spacing: 30){
                        EmojiButtonView(feeling: .sad)
                        EmojiButtonView(feeling: .neutral)
                        EmojiButtonView(feeling: .happy)
                    }
                    .font(.system(size: 60))
                }
                .toolbar {
                    ToolbarItem (placement: .navigation){
                        Button{
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.backward")
                            Text("Back")
                        }
                    }
                    ToolbarItem(placement: .automatic){
                        Button("Save"){

                        }
                    }
                }
                .navigationTitle("Reflect on your day")
//                Spacer()
            }
        }
    }
}

extension WriteReflectionView {
    
    struct EmojiButtonView: View {
        
        @State private var isSelected: Bool = false
        
        let feeling: Feeling
        
        var icon: String {
            
            switch feeling {
            case .sad:
                return "😫"
            case .neutral:
                return  "😐"
            case .happy:
                return  "😀"
            }
        }
        
        var body: some View {
            
            if isSelected {
                Button(icon) {
                    isSelected.toggle()
                }
            } else {
                Button(icon) {
                    isSelected.toggle()
                }
                .opacity(0.4)
            }
        }
    }
}

enum Feeling {
    case sad
    case neutral
    case happy
}

struct WriteReflectionView_Previews: PreviewProvider {
    static var previews: some View {
        WriteReflectionView()
    }
}
