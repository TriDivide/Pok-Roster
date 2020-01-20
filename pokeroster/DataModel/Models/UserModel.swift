import Firebase
import Combine

class UserModel: BaseModel {
    
    public static let instance = UserModel()
    private let userRef = Firestore.firestore().collection("users")
    private var user: User?
    
    let loginStatus = PassthroughSubject<Bool, Never>()

    var authStatus: Bool {
        get { return isLoggedIn() }
        set { self.loginStatus.send(newValue) }
    }

    
    public func doLogin(email: String, password: String, completion: @escaping(Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) {(user, error) in
            if let error = error {
                completion(error)
                self.authStatus = false
                return
            }
            
            guard let _ = user else {
                completion(UserModelError.AuthenticationFailed)
                self.authStatus = false
                return
            }
            self.authStatus = true
            completion(nil)
        }
    }
    
    public func doSignUpAndLogin(username: String, email: String, password: String, completion: @escaping(Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                completion(error)
                self.authStatus = false
                return
            }
            
            guard let userId = authResult?.user.uid else {
                completion(UserModelError.AuthenticationFailed)
                self.authStatus = false
                return
            }
            self.authStatus = true
            self.setUserData(email: email, username: username, userId: userId, completion: completion)
        }
    }
    
    public func setUserData(email: String, username: String, userId: String, completion: @escaping(Error?) -> Void) {
        let user = User(email: email, username: username)
        userRef.document(userId).setData(user.toMap(), merge: true) { error in
            completion(error)
        }
    }
    
    public func isLoggedIn() -> Bool {
        self.authStatus = Auth.auth().currentUser != nil
        return Auth.auth().currentUser != nil
    }
    
    public func doLogout(completion: @escaping(Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            self.user = nil
            self.authStatus = false
            completion(nil)
        }
        catch {
            completion(error)
        }
    }
    
    public func getCurrentUser(completion: @escaping(User?, Error?) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else {
            completion(nil, UserModelError.NotLoggedIn)
            return
        }
        
        userRef.document(userId).getDocument {(document, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let document = document, let data = document.data() else {
                completion(nil, UserModelError.UserNotFound)
                return
            }
            
            guard let email = data["email"] as? String, let username = data["username"] as? String else {
                completion(nil, UserModelError.InvalidData)
                return
            }
            
            let user = User(email: email, username: username)
            self.user = user
            completion(user, nil)
        }
        
    }
}
