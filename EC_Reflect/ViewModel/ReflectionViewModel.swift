//
//  ReflectionVM.swift
//  EC_Reflect
//
//  Created by Ariuna Banzarkhanova on 13/01/23.
//

import Foundation
import CoreData

class ReflectionViewModel: ObservableObject {
    
    @Published var reflections: [ReflectionNote] = []
    @Published var countuniqueDays: Int = 0
    
    
    
    init() {
        fetchLearners()
    }
    
    func fetchLearners() {
        let uniqueDays = NSCountedSet()
        let request = NSFetchRequest<ReflectionNote>(entityName: "ReflectionNote")
        
        do {
            reflections = try PersistenceManager.shared.container.viewContext.fetch(request)
            
            for reflection in reflections {
                uniqueDays.add(dateToString(date: reflection.date!))
            }
            
            countuniqueDays = uniqueDays.count
            
        } catch {
            print("Error fetching. \(error)")
        }
        
    }
    
    
    
    
    func addNewReflectionNote(notes: String, feeling: Feeling) {
        let newReflectionNote = ReflectionNote(context: PersistenceManager.shared.container.viewContext)
        newReflectionNote.id = UUID()
        newReflectionNote.notes = notes
        newReflectionNote.date = Date()
        newReflectionNote.feeling = feeling.rawValue
        
        saveChanges()
    }
    
    func saveChanges() {
        PersistenceManager.shared.saveContext() { error in
            guard error == nil else {
                print("An error occurred while saving: \(error!)")
                return
            }
            self.fetchLearners()
        }
    }
    
//    func saveReflection(reflection: Reflection) {
//        reflections.append(reflection)
//    }
}

public func dateTimeToString(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm, d MMM y"
    return formatter.string(from: date)
}

public func dateToString(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "d MMMM y"
    return formatter.string(from: date)
}
