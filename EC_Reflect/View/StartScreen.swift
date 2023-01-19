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
        
      
            VStack (alignment: .leading) {
                
                            VStack (alignment: .leading) {
                
                                Text("Hello, Irina!")
                                    .font(.system(size: 20).bold())
                                    .fontWeight(.regular)
                
                                    Text("Today")
                                        .font(.system(size: 40).bold())
                                        .fontWeight(.bold)
                
                                    Text("Thursday, 13 January")
                                        .font(.system(size: 20).bold())
                                        .fontWeight(.regular)
                
                            }
                            .padding(.top, 10)
                
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
                        .sheet(isPresented: $showingWriteReflectionView, content: { WriteReflectionView(reflectionVM: reflectionVM)
                            
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
                .padding(.top, 20)
                .padding(.bottom, 10)
                
        
                
                
                
                
                
            }
         
        
        
        
       
 
    }
    
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
