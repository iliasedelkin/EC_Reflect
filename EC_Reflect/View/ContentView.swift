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
    @ObservedObject var quoteVM = QuoteViewModel()
    
    var body: some View {
        
        if profileVM.isAuthenticated {
            
            TabView {
                
                StartScreen(reflectionVM: reflectionVM, profileVM: profileVM, quoteVM: quoteVM)
                    .tabItem {
                        Label("Today", systemImage: "doc.text.image")
                           
                        
                    }
                
                JournalView(reflectionVM: reflectionVM)
                    .tabItem {
                        Label("Journal", systemImage: "text.book.closed.fill")
                    }
                
                ProfileView(profileVM: profileVM)
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                        
                    }
            }
        
        } else {
            WelcomeView(profileVM: profileVM)
        }
            
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
