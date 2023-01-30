//
//  StartscreenCardView.swift
//  EC_Reflect
//
//  Created by Alexey on 19/01/23.
//

import SwiftUI

struct StartscreenCardView: View {
    @ObservedObject var reflectionVM: ReflectionViewModel
    @State private var showingWriteReflectionView: Bool = false
    
    var body: some View {
        ZStack{
            Image("bg")
                .resizable()
                .scaledToFill()
            
                .frame(width: 360, height: 270)
                .clipped()
                .cornerRadius(15)
            
            VStack{
                Text("How was your day?")
                
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                
                Button{
                    showingWriteReflectionView.toggle()
                    print("toggle")
                }label: {
                    ZStack{
                        HStack (alignment: .center){
                            Text("Daily reflection")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                            Image(systemName: "arrow.right")
                                .foregroundColor(.black)
                            
                        }
                        .padding(.init(top: 20, leading: 30, bottom: 20, trailing: 30))
                        .background(Color.white)
                        .cornerRadius(15)
                    }
                }
                .fullScreenCover(isPresented: $showingWriteReflectionView, content: {
                    let reflection = ReflectionNote(context: PersistenceManager.shared.container.viewContext)
                    WriteReflectionView(reflectionVM: reflectionVM, reflection: reflection)
                    }
                )
                Text("It's day 4 of reflection. Great job!")
                    .font(.system(size: 20))
                    .fontWeight(.regular)
                
                    .frame(width: 350, height: 50)
                    .foregroundColor(.white)
                    .padding(.top, 20)
            }
            .padding(.top, 10)
        }
    }
}

struct StartscreenCardView_Previews: PreviewProvider {
    static var previews: some View {
        StartscreenCardView(reflectionVM: ReflectionViewModel())
    }
}

