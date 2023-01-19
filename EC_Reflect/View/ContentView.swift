//
//  ContentView.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 11/01/23.
//

import SwiftUI

struct ContentView: View {
    let vm = ReflectionViewModel()
    
    var body: some View {
        TabView {
            
            StartScreen(reflectionVM: vm, quoteVM: QuoteViewModel())
                .tabItem {
                    Label("Today", systemImage: "doc.text.image")
                    
                }
            
            JournalView(reflectionVM: vm)
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
