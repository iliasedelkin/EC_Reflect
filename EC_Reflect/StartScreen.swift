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
                Text(title)
                    .font(.system(size: 40).bold())
                    .fontWeight(.light)
                Spacer()
            }
            .padding(.top, 40)
            .padding(.leading, 16)
          
            HStack{
                Text ("This week")
                    .font(.system(size: 20))
                Spacer()
            }
            .padding(.leading, 16)
            .padding(.top, 15)
            HStack (spacing: 25){
                VStack {
                    Circle()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.gray)
                    Text ("Mon")
                }
                VStack {
                    Circle()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.gray)
                    Text ("Tue")
                }
               
                VStack {
                    Circle()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.gray)
                    Text ("Wed")
                }
              
                VStack {
                    Circle()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.blue)
                    Text ("Thu")
                }
        
                VStack {
                    Circle()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.gray)
                    Text ("Fri")
                    
                }
                   
                VStack {
                    Circle()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.gray)
                    Text ("Sat")
                }
                VStack {
                    Circle()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.gray)
                    Text ("Sun")
                }
                    
                
               
            }
            .padding(.top, 15)
            
            Spacer()
            
            Button{
                showingWriteReflectionView.toggle()
                print("toggle")
            }label: {
                        HStack{
                            Text("Daily reflection")
                                .font(.system(size: 25))
                                .fontWeight(.light)
                                .foregroundColor(.white)
                            Image(systemName: "arrow.right")
                                .foregroundColor(.white)
                        }
                        .padding(.init(top: 15, leading: 30, bottom: 15, trailing: 30))
                        .background(Color.black)
                        .cornerRadius(60)
                        .padding(.bottom, 350)
                
                
            }
            .sheet(isPresented: $showingWriteReflectionView, content: { WriteReflectionView()})
            
        }
 
    }
    
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen()
    }
}
