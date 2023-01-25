//
//  ContentView.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 11/01/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var reflectionVM = ReflectionViewModel()
    @ObservedObject var profileVM = ProfileViewModel()
    
    var body: some View {
        
        if profileVM.isAuthenticated {
            
            TabView {
                          
                StartScreen(reflectionVM: reflectionVM, quoteVM: QuoteViewModel())
                    .tabItem {
                        Label("Today", systemImage: "doc.text.image")
                        
                    }
                
                JournalView(reflectionVM: reflectionVM)
                    .tabItem {
                        Label("Journal", systemImage: "text.book.closed.fill")
                    }
                
                SettingsView(welcomeVM: profileVM)
                    .tabItem {
                        Label("Settings", systemImage: "gearshape.fill")
                        
                    }
            }
        } else {
            WelcomeView(welcomeVM: profileVM)
        }
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
