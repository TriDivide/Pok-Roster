import Foundation


enum UserModelError: Error {
    case UserNotFound
    
}

extension UserModelError: LocalizedError{
    public var errorDescription: String? {
        switch self {
        case .UserNotFound:
            return NSLocalizedString("User not found", comment: "UserNotFound")
        }
    }
}
