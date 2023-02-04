//
//  WriteReflectionView.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 12/01/23.
//

import SwiftUI

struct WriteReflectionView: View {
    
    @ObservedObject var addEditVM: AddEditViewModel
    
    @State private var isEmojiSelected: Bool = false
    @FocusState private var textFieldFocused: Bool
    
    @Binding var addReflection: Bool
    
    @State var editReflection = false
    
    @State var showAlert = false
    
    @Environment (\.dismiss) private var dismiss
    
    
    var background: some View {
        RoundedRectangle(cornerRadius: 10.0)
            .padding()
            .foregroundColor(Color("TextFieldColor"))
    }
    
    var body: some View {
        
        NavigationStack{
            VStack {
                HStack {
                    Text ("Reflect on your day")
                        .font(.custom("Nunito-Bold", size: 35))
                        .padding(.top, 30)
                        .padding(.leading, 20)
                    Spacer()
                }
                
                ZStack (alignment: .topTrailing){
                    //background
                    TextField("""
                              Share what made you feel good or bad
                              """, text: $addEditVM.notes, axis: .vertical)
                    .font(.custom("Nunito-Regular", size: 18))
                    .lineLimit(1...8)
                    .padding(.leading, 22)
                    .focused($textFieldFocused)
                    .onChange(of: addEditVM.notes) { newValue in
                        editReflection.toggle()
                    }
                }
                Spacer()
                VStack (spacing: 19){
                    Text("Overall, was the day good or bad?")
                        .font(.custom("Nunito-Bold", size: 18))
                    
                    HStack(spacing: 30){
                        EmojiButtonView(feelingToAdd: $addEditVM.feeling, feeling: .sad)
                        EmojiButtonView(feelingToAdd: $addEditVM.feeling, feeling: .neutral)
                        EmojiButtonView(feelingToAdd: $addEditVM.feeling, feeling: .happy)
                    }
                    .font(.system(size: 60))
                    .padding(.bottom, 20)
                }
                .toolbar {
                    ToolbarItem (placement: .navigation){
                        Button{
                            if editReflection {
                                showAlert.toggle()
                            } else {
                                dismiss()
                            }
                        } label: {
                            //                            Image(systemName: "chevron.backward")
                            Text("Cancel")
                        }
                    }
                    ToolbarItem(placement: .automatic){
                        Button("Save"){
                            
                            addEditVM.addNewReflectionNote(context: PersistenceManager.shared.container.viewContext)
                            addReflection.toggle()
                            dismiss()
                        }
                        .disabled(addEditVM.feeling == .unknown)
                    }
                    
                }
                .onAppear{
                    textFieldFocused = true
                }
                .alert(isPresented: $showAlert){
                    Alert(
                        title: Text("Reflection is not saved"),
                        message: Text("Are you sure you want to close the window?"),
                        primaryButton: .cancel(),
                        secondaryButton: .destructive(Text("Close the window")){
                            dismiss()
                        })
                }
                
                // .navigationTitle("Reflect on your day")
                .font(.custom("Nunito-Bold", size: 16))
                
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

//struct WriteReflectionView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        WriteReflectionView(addEditVM: AddEditViewModel())
//    }
//}
