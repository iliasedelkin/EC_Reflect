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
                    ScrollView{
                    VStack(spacing: 10) {
                        
                        switch quoteVM.quoteLoadable {
                            
                        case .idle:
                            Text("Idle")
                            
                        case .loading:
                            Text("Loading..")
                            
                        case .loaded(let quote):
                            // Quote appearance can be changed here
                            Text(quote.first?.quote ?? "No quote")
                                .font(.system(size: 25))
                                .multilineTextAlignment(.center)
                                .lineLimit(4)
                            Text(quote.first?.author ?? "No author")
                            
                        case .error(let error):
                            Text(error.localizedDescription)
                        }
                    }
                    .frame(width: 300.0, height: 100)
                    //        .onReceive(timer) { _ in
                    .task{
                        await quoteVM.getQuote()
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
