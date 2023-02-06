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
    @Published var uniqueDaysСounter: Int = 0
    @Published var daysInRowCounter: Int = 0
    
    
    
    init() {
        fetchReflections()
    }
    
    func fetchReflections() {
        let uniqueDays = NSCountedSet()
        var currentDate = Date()
        
        let request = NSFetchRequest<ReflectionNote>(entityName: "ReflectionNote")
        
        do {
            reflections = try PersistenceManager.shared.container.viewContext.fetch(request)
            
            for reflection in reflections {
                let date = reflection.date!
                let currentStreak = numberOfDaysBetween(from: date, and: currentDate)
                
                uniqueDays.add(dateToString(date: date))
                
                if (currentStreak > 2){
                    break
                }
                if (currentStreak == 1){
                    daysInRowCounter+=1
                }
                
                currentDate = date
                                
            }
            uniqueDaysСounter = uniqueDays.count
            
        } catch {
            print("Error fetching. \(error)")
        }
        
    }
    
    func deleteReflection(reflection: ReflectionNote) {
        PersistenceManager.shared.container.viewContext.delete(reflection)
        saveChanges()
    }
    
    func deleteRefOffset(offsets: IndexSet) {
        offsets.map { reflections[$0] }.forEach(PersistenceManager.shared.container.viewContext.delete)
        saveChanges()
    }
    
    func saveChanges() {
        PersistenceManager.shared.saveContext() { error in
            guard error == nil else {
                print("An error occurred while saving: \(error!)")
                return
            }
            self.fetchReflections()
        }
    }
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


func numberOfDaysBetween(from fromDate: Date,  and toDate: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: fromDate, to: toDate).day ?? 0
    }


