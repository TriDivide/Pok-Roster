struct User {
    var email: String
    var username: String
    
    func toMap() -> [String: Any] {
        var map = [String: Any]()
        map["email"] = email
        map["username"] = username
        return map
    }
}
