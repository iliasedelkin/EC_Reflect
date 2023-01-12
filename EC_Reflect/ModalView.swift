//
//  ModalView.swift
//  EC_Reflect
//
//  Created by Ariuna Banzarkhanova on 12/01/23.
//

import SwiftUI

struct ModalView: View {
    @State private var reflection: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                ZStack (alignment: .topTrailing){
                    Image("dots")
                    
                    TextField("Write down what made you feel good or bad", text: $reflection)
                        .padding()
                }
                VStack (spacing: 19){
                    Text("Overall, was the day good or bad?")
                        .font(.system(size: 18))
                        .fontWeight(.black)
                    HStack(spacing: 30){
                        Button("😫"){
                        }
                        Button("😐"){
                        }
                        Button("😀"){
                        }
                    }
                    .font(.system(size: 60))
                }
                .toolbar {
                    ToolbarItem (placement: .navigation){
                        Button{
                            //ggy
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
                Spacer()
            }
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
