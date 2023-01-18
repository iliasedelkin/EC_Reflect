//
//  StartScreen.swift
//  EC_Reflect
//
//  Created by Alexey on 12/01/23.
//

import SwiftUI

struct StartScreen: View {
    @ObservedObject var reflectionVM: ReflectionViewModel
    @State private var showingWriteReflectionView: Bool = false
    
    var title = "Today"

    var body: some View {
        
        VStack (alignment: .center) {
            HStack{
                Text("Hello, Irina!")
                    .font(.system(size: 20).bold())
                    .fontWeight(.regular)
                Spacer()
            }
            .padding(.top, 30)
            .padding(.leading, 16)
            HStack{
                Text("Today")
                    .font(.system(size: 40).bold())
                    .fontWeight(.black)
                Spacer()
            }
        
            .padding(.leading, 16)
            HStack{
                Text("Thursday, 13 January")
                    .font(.system(size: 20).bold())
                    .fontWeight(.regular)
                Spacer()
            }
        
            .padding(.leading, 16)
     

            
            Spacer()
            ZStack {

                VStack{
                    Text("How was your day?")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                
                        .foregroundColor(.white)
                        .padding(.top, 15)
                      
                    Button{
                        showingWriteReflectionView.toggle()
                        print("toggle")
                    }label: {
                        ZStack{
                            HStack (alignment: .center){
                                Text("Daily reflection")
                                    .font(.system(size: 25))
                                    .foregroundColor(.black)
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.black)
                                
                            }
                            .padding(.init(top: 20, leading: 40, bottom: 20, trailing: 40))
                            .background(Color.white)
                            .cornerRadius(50)
                            
                        }
                        .padding(.top, 15)
                        
                    }
                    .sheet(isPresented: $showingWriteReflectionView, content: { WriteReflectionView(reflectionVM: reflectionVM)})
                    Text("It's day 4 of reflection. Great job!")
                        .font(.system(size: 20))
                        .fontWeight(.regular)
                    
                        .frame(width: 350, height: 50)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                }
                .background {
                    Image("bg")
                    
                        .frame(width: 365, height: 280)
                        
                        .cornerRadius(15)
                }
            
                
               
            }

           
            
        }.padding(.bottom, 300)
 
    }
    
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen(reflectionVM: ReflectionViewModel())
    }
}
