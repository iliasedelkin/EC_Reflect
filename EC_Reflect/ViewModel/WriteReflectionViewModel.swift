//
//  WriteReflectionViewModel.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 16/01/23.
//

import Foundation

class WriteReflectionViewModel: ObservableObject {
    @Published var reflection: Reflection
    
    init(reflection: Reflection) {
        self.reflection = reflection
    }
}
