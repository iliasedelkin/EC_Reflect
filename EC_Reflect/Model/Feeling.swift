//
//  Feeling.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 16/01/23.
//

import Foundation
import SwiftUI

enum Feeling: String, Codable {
    case sad
    case neutral
    case happy
    case unknown
}

func emojiFromFeeling(feeling: Feeling) -> Image {
    switch(feeling) {
    case .sad:
        return Image("sad")
        
    case .neutral:
        return Image("neutral")
    case .happy:
        return Image("happy")
    default:
        return Image("")
    }
}


