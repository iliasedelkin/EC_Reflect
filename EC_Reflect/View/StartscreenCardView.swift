//
//  StartscreenCardView.swift
//  EC_Reflect
//
//  Created by Alexey on 19/01/23.
//

import SwiftUI

struct StartscreenCardView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var reflectionVM: ReflectionViewModel
    @ObservedObject var profileVM: ProfileViewModel
    @State private var addRefllection: Bool = false
    
    var body: some View {
        ZStack {
          RoundedRectangle(cornerRadius: 15)
                .stroke(colorScheme == .light ? .black : .white)
                
                .frame(width: 360, height: 300)
            
       
            VStack (spacing: 5){
                Image("bg")
                    .resizable()
                    .frame(width: 360, height: 135)
                    .offset(y: -2)
          
                Text("How was your day?")
                
                    .font(.custom("Nunito-Bold", size: 26))
                    .fontWeight(.bold)
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .padding(.top, 3)
                DaysCounterView(reflectionVM: reflectionVM, profileVM: profileVM)
                   
                Button{
                    addRefllection.toggle()
                    print("toggle")
                }label: {
                    ZStack{
                        RoundedRectangle (cornerRadius: 50)
//                            .stroke(colorScheme == .light ? .black : .white)
                               .frame(width: 300, height: 60)
                               .foregroundColor(colorScheme == .light ? .accentColor : .white)
                        HStack (alignment: .center){
                            Text("Daily reflection")
                                .font(.custom("Nunito-Bold", size: 20))
                                .foregroundColor(colorScheme == .light ? .white : .black)
                            Image(systemName: "arrow.right")
                                .foregroundColor(colorScheme == .light ? .white : .black)
                                .fontWeight(.bold)
                            
                        }
                   
                       
                        
                     
                    }
                }
                .fullScreenCover(isPresented: $addRefllection, content: { WriteReflectionView(addEditVM: AddEditViewModel(), addReflection: $addRefllection)
                }
                )
                .padding(.top, 10)

                .padding(.bottom, 13)

               
    
            

            }
       
        }
    }
}


struct StartscreenCardView_Previews: PreviewProvider {
    static var previews: some View {
        StartscreenCardView(reflectionVM: ReflectionViewModel(), profileVM: ProfileViewModel())
    }
}

