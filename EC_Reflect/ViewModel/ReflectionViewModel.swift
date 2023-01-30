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
    
    
    init() {
        fetchLearners()
    }
    
    func fetchLearners() {
        let request = NSFetchRequest<ReflectionNote>(entityName: "ReflectionNote")
        
        do {
            reflections = try PersistenceManager.shared.container.viewContext.fetch(request)
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
    
    func test(reflection: ReflectionNote, notes: String, feeling: Feeling) {
        if reflection.id == nil {
            let newReflectionNote = ReflectionNote(context: PersistenceManager.shared.container.viewContext)
            newReflectionNote.id = UUID()
            newReflectionNote.notes = notes
            newReflectionNote.date = Date()
            newReflectionNote.feeling = feeling.rawValue
        } else {
            reflection.notes = notes
            reflection.feeling = feeling.rawValue
        }
        saveChanges()
    }
    
    func notesToChange(reflection: ReflectionNote) -> String {
        var notes = ""
        
        if reflection.id != nil{
            let reflectionNotes = reflection.notes!
            notes = reflectionNotes
        }
        return notes
    }
    
    func feelingToChange(reflection: ReflectionNote) -> Feeling {
        var feeling: Feeling = .unknown
        
        if reflection.id != nil {
            let reflectionFeeling = reflection.feeling
            feeling = Feeling(rawValue: reflectionFeeling!)!
        }
        return feeling
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
    formatter.dateFormat = "d MMM y"
    return formatter.string(from: date)
}
