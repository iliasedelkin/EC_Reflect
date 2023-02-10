//
//  AuthStatus.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 08/02/23.
//

import Foundation

enum AuthStatus {
    case inProgress
    case authorized
    case failed(Error)
}
