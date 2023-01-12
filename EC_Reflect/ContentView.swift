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
                    Image(systemName: "heart")
                    Text("Home")
                }
        }
        
       
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
        
        .padding()
    }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
