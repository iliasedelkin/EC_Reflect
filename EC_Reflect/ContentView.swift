//
//  ContentView.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 11/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            StartScreen()
                .tabItem {
                    Label("Today", systemImage: "doc.text.image")
                }
            
            JournalView()
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
