//
//  StartScreen.swift
//  EC_Reflect
//
//  Created by Alexey on 12/01/23.
//

import SwiftUI

struct StartScreen: View {
    
    @State private var showingWriteReflectionView: Bool = false
    
    var title = "Today"
    var days = "0"
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
                    .font(.system(size: 50).bold())
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
            
            Button{
                showingWriteReflectionView.toggle()
                print("toggle")
            }label: {
                ZStack{
              
                    HStack (alignment: .center){
                        Text("Daily reflection")
                            .font(.system(size: 25))
                            .fontWeight(.light)
                            .foregroundColor(.white)
                        Image(systemName: "arrow.right")
                            .foregroundColor(.white)
                        
                    }
                    .padding(.init(top: 20, leading: 40, bottom: 20, trailing: 40))
                    .background(Color.black)
                    .cornerRadius(50)
                    
                }
                
            }
            .sheet(isPresented: $showingWriteReflectionView, content: { WriteReflectionView()})
            Text("It's 4th day of reflection. Great job!")
                .font(.system(size: 20))
                .fontWeight(.regular)
                
                .frame(width: 350, height: 50)
                .foregroundColor(.black)
        }.padding(.bottom, 300)
 
    }
    
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen()
    }
}
