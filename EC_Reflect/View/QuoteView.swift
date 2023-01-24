//
//  QuoteView.swift
//  EC_Reflect
//
//  Created by Ariuna Banzarkhanova on 18/01/23.
//

import SwiftUI

struct QuoteView: View {
    @ObservedObject var quoteVM = QuoteViewModel()
    @State var refreshQuote: Bool = false
    
    var body: some View {
        ZStack{
           
        VStack (alignment: .leading){
            Text("Quote of the day")
                .font(.title)
                .fontWeight(.semibold)
            
            VStack (alignment: .leading, spacing: 10) {
                
                if let quote = quoteVM.quote?.first {
                    
                    Text(quote.quote)
                        .font(.system(size: 25))
                    
                    Text(quote.author)
                    
                } else {
                    Text("You are better than you were be")
                }
            }
            .lineLimit(4)

            
            .task{
                await quoteVM.getQuote()
            }
            
            .padding(.top, 15)
            
            
            
            
            
            
            Button {
                refreshQuote.toggle()
                if refreshQuote == true {
                    Task {
                        await quoteVM.getQuote()
                        refreshQuote.toggle()
                    }
                }
            } label: {
                Image(systemName: "arrow.clockwise")
                    .foregroundColor(.black)
            }
            
            .padding(.top, 5)
            
            
            
        }
        .frame(width: 360, height: 240)
  
    }
        //.frame(width: 350, height: 240)
   
        
        .padding()
    }
}


struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        //QuoteView()
        ContentView()
    }
}
