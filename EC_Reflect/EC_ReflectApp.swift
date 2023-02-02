//
//  EC_ReflectApp.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 11/01/23.
//

import SwiftUI

@main
struct EC_ReflectApp: App {
    
//    let persistenceManager = PersistenceManager.shared
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
//                .environment(\.managedObjectContext, persistenceManager.container.viewContext)
        }
    }
}
