//
//  AddEditViewModel.swift
//  EC_Reflect
//
//  Created by Ariuna Banzarkhanova on 02/02/23.
//

import Foundation
import CoreData
import Combine

class AddEditViewModel: ObservableObject {
    @Published var notes = ""
    @Published var feeling: Feeling = .unknown
    @Published var reflection: ReflectionNote!
    
    func addNewReflectionNote(context: NSManagedObjectContext) {
        if reflection == nil {
            let newReflectionNote = ReflectionNote(context: context)
            newReflectionNote.id = UUID()
            newReflectionNote.notes = notes
            newReflectionNote.date = Date()
            newReflectionNote.feeling = feeling.rawValue
        } else {
            reflection.notes = notes
            reflection.feeling = feeling.rawValue
        }
        save(context: PersistenceManager.shared.container.viewContext)
        notes = ""
        feeling = .unknown
    }
    
    func editReflectionNote (reflection: ReflectionNote) {
        self.reflection = reflection
    }
    
    func save(context:NSManagedObjectContext){
        do{
            try context.save()
        }
        catch{
            print(error)
        }
    }
}
