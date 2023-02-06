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
        
        VStack (alignment: .leading, spacing: 10) {
            HStack {
                Text("Quote of the day")
                    .font(.custom("Nunito-Bold", size: 24))
                    .fontWeight(.bold)
                
                Spacer()
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
                    }
                }
            }
            HStack (alignment: .top){
            VStack (alignment: .leading){
               
                switch quoteVM.quoteLoadable {
                    
                case .idle:
                    Text("Idle")
                    
                case .loading:
                    Text("Loading..")
                        .font(.custom("Nunito-Regular", size: 22))
                        .padding(.top, 5)
                    
                case .loaded(let quote):
                    // Quote appearance can be changed here
                    Text(quote.first?.quote ?? "No quote")
                        .font(.custom("Nunito-Regular", size: 22))
                        .minimumScaleFactor(0.01)
                        .padding(.top, 5)
                    Text(quote.first?.author ?? "No author")
                        .font(.custom("Nunito-Bold", size: 16))
                        .padding(.top, 1)
                case .error(let error):
                    Text(error.localizedDescription)
                        
                }
            }
            }.frame(height: 180, alignment: .topLeading)
        }
  
        .task{
            await quoteVM.getQuote()
        }
       
        .padding()
        
        .padding(.top, 30)
    }
    
    
}


struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
