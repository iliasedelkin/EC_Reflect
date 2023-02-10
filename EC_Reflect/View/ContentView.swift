//
//  ContentView.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 11/01/23.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    
    @ObservedObject var profileVM = ProfileViewModel()
    @ObservedObject var reflectionVM = ReflectionViewModel()
    
    @StateObject var quoteVM = QuoteViewModel()
    
    
    var body: some View {
        
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(profileVM: ProfileViewModel())
    }
}
