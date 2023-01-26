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
                          
                StartScreen(reflectionVM: reflectionVM, profileVM: profileVM)
                    .tabItem {
                        Label("Today", systemImage: "doc.text.image")
                        
                    }
                
                JournalView(reflectionVM: reflectionVM)
                    .tabItem {
                        Label("Journal", systemImage: "text.book.closed.fill")
                    }
                
                ProfileView(profileVM: profileVM)
                    .tabItem {
                        Label("Profile", systemImage: "person")
                        
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
