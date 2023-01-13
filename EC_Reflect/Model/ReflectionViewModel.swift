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
}
