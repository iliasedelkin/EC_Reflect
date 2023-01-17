//
//  Feeling.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 16/01/23.
//

import Foundation

enum Feeling: String, Codable {
    case sad
    case neutral
    case happy
    case unknown
}

func emojiFromFeeling(feeling: Feeling) -> String {
    switch(feeling) {
    case .sad:
        return "😫"
    case .neutral:
        return "😐"
    case .happy:
        return "😀"
    default:
        return ""
    }
}
