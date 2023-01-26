//
//  ContentView.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 11/01/23.
//

import SwiftUI

struct ContentView: View {
    let reflectionVM = ReflectionViewModel()
    
    var body: some View {
        TabView {
            
            StartScreen(reflectionVM: reflectionVM, quoteVM: QuoteViewModel())
                .tabItem {
                    Label("Today", systemImage: "doc.text.image")
                    
                }
            
            JournalView(reflectionVM: reflectionVM)
                .tabItem {
                    Label("Journal", systemImage: "text.book.closed.fill")
                }
        }
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
