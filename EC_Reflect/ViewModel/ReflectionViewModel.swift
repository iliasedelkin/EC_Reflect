//
//  ReflectionVM.swift
//  EC_Reflect
//
//  Created by Ariuna Banzarkhanova on 13/01/23.
//

import Foundation

class ReflectionViewModel: ObservableObject {
    
    @Published var reflections: [Reflection] = reflectionData
    
//    init() {
//        self.reflections = reflectionData
//    }
    
    func saveReflection(reflection: Reflection) {
        reflections.append(reflection)
    }
    
    public func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm, d MMM y"
        return formatter.string(from: date)
    }
    
}
