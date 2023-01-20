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
            ZStack (alignment: .bottom){
                RoundedRectangle(cornerRadius: 15)
                    .shadow(radius: 5)
                    .foregroundColor(Color.white)
//                    .frame(width: 350, height: 250)
                HStack {
                    Spacer()
                    Button {
                        refreshQuote.toggle()
//                        print("Quote reftesh requested, refreshQuote: \(refreshQuote)")
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
                }
                .padding()
            }
            VStack (spacing: 5){
                Text("Quote of the day")
                    .font(.title)
                    .fontWeight(.semibold)
                VStack(spacing: 10) {
                    
                    if let quote = quoteVM.quote?.first {
                        
                        Text(quote.quote)
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                            .lineLimit(4)
                        Text(quote.author)
                        
                    } else {
                        Text("Loading...")
                    }
                }
                .frame(width: 300.0, height: 150.0)
                //        .onReceive(timer) { _ in
                .task{
                    await quoteVM.getQuote()
                }
            }
        }
        .padding()
    }
}


struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
