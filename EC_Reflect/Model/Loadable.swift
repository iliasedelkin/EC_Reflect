//
//  Loadable.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 21/01/23.
//

import Foundation

enum Loadable <T, E: Error> {
    case idle
    case loading
    case loaded(T)
    case error(E)
    
}
