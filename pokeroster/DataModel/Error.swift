//
//  Error.swift
//  pokeroster
//
//  Created by Liam Smith on 15/01/2020.
//  Copyright © 2020 Liam Smith. All rights reserved.
//

import Foundation

 
 enum UserModelError: Error {
    case UserNotFound
    case AuthenticationFailed
    case NotLoggedIn
    case InvalidData
 }
 
 extension UserModelError: LocalizedError{
    public var errorDescription: String? {
        switch self {
        case .UserNotFound:
            return NSLocalizedString("User not found", comment: "UserNotFound")
        case .AuthenticationFailed:
            return NSLocalizedString("Authentication failed, please contact support", comment: "AuthFailed")
        case .NotLoggedIn:
            return NSLocalizedString("You are not currently logged in. Please log in", comment: "NotLoggedIn")
        case .InvalidData:
            return NSLocalizedString("User data received is invalid", comment: "InvalidData")
        }
    }
}
