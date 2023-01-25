//
//  ContentView.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 11/01/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var reflectionVM = ReflectionViewModel()
    @ObservedObject var welcomeVM = WelcomeViewModel()
    
    var body: some View {
        
        if welcomeVM.isAuthenticated {
            
            TabView {
                          
                StartScreen(reflectionVM: reflectionVM, quoteVM: QuoteViewModel())
                    .tabItem {
                        Label("Today", systemImage: "doc.text.image")
                        
                    }
                
                JournalView(reflectionVM: reflectionVM)
                    .tabItem {
                        Label("Journal", systemImage: "text.book.closed.fill")
                    }
                
                SettingsView(welcomeVM: welcomeVM)
                    .tabItem {
                        Label("Settings", systemImage: "gearshape.fill")
                        
                    }
            }
        } else {
            WelcomeView(welcomeVM: welcomeVM)
        }
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
