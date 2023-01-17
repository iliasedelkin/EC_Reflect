//
//  ReflectionVM.swift
//  EC_Reflect
//
//  Created by Ariuna Banzarkhanova on 13/01/23.
//

import Foundation

class ReflectionViewModel: ObservableObject {
    @Published var reflection: Reflection
    
    init(reflection: Reflection) {
        self.reflection = reflection
    }
    
    var reflections: [Reflection] = [reflection1, reflection2, reflection3, reflection4]
    
    func saveReflection(reflection: Reflection) {
        reflections.append(reflection)
    }
}
