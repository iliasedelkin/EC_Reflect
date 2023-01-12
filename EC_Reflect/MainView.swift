//
//  TabView.swift
//  EC_Reflect
//
//  Created by Irina Deeva on 12/01/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            
            ContentView()
                .tabItem {
                    Label("Today", systemImage: "doc.text.image")
                }
            
            JournalView()
                .tabItem {
                    Label("Journal", systemImage: "text.book.closed.fill")
                }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
