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
        
            
            VStack (alignment: .leading, spacing: 10){
                Text("Quote of the day")
         
                
                    .font(.custom("Nunito-Bold", size: 24))
                    .fontWeight(.bold)
                 
                VStack(alignment: .leading) {
                    
                        switch quoteVM.quoteLoadable {
                            
                        case .idle:
                            Text("Idle")
                            
                        case .loading:
                            Text("Loading..")
                            
                        case .loaded(let quote):
                            // Quote appearance can be changed here
                            Text(quote.first?.quote ?? "No quote")
                                .font(.custom("Nunito-Regular", size: 24))
                                .multilineTextAlignment(.leading)
                                .scaledToFit()
                                .lineLimit(4)
                               
                            Text(quote.first?.author ?? "No author")
                                .font(.custom("Nunito-Regular", size: 16))
                                .padding(.top, 20)
                            
                        case .error(let error):
                            Text(error.localizedDescription)
                        }
                    }
                    .frame(width: 340.0, height: 150)
                   
                    .task{
                        await quoteVM.getQuote()
                    }
                
           
                
                HStack {
               
                    Button {
                        refreshQuote.toggle()
                        if refreshQuote == true {
                            Task {
                                await quoteVM.getQuote()
                                refreshQuote.toggle()
                            }
                        }
                    } label: {
                        HStack{
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(.black)
                            Text ("Refresh")
                        }
                    }
                }
             
            }
            
                .padding(.top, 30)
        
     
    }
}


struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
