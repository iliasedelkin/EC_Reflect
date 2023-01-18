//
//  ReflectionsDatabase.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 16/01/23.
//

import Foundation

//var reflection0 = Reflection(id: 0, date: "",
//                             notes: "",
//                             feeling: .unknown)


var reflectionData: [Reflection] = [reflection1, reflection2, reflection3, reflection4]

var reflection1 = Reflection(id: UUID(), date: Date().addingTimeInterval(-60 * 24 * 10),
                             notes: "I love my classmates, they are so nice ... I hope we meet on the weekend.",
                             feeling: .happy)

var reflection2 = Reflection(id: UUID(), date: Date().addingTimeInterval(-60 * 24 * 9),
                             notes: "Today the weather is not good, but luckily I took my umbrella. I hate rain.",
                             feeling: .neutral)

var reflection3 = Reflection(id: UUID(), date: Date().addingTimeInterval(-60 * 24 * 8),
                             notes: "I am  so tired, I should have gone to bed earlier. Deprivation of sleeping is the worst thing.",
                             feeling: .sad)

var reflection4 =  Reflection(id: UUID(), date: Date().addingTimeInterval(-60 * 24 * 7),
                             notes: "Today the crazy old lady watched TV loud again. But we made a prototype for Challenge.",
                              feeling: .happy)

