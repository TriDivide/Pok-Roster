import FirebaseAuth
import FirebaseFirestore

class UserModel: BaseModel {
    
    public static let instance = UserModel()
    private let userRef = Firestore.firestore().collection("users")

    
    public func doLogin(email: String, password: String, completion: @escaping(User?, Error?) -> Void) {
        
        
    }
}
