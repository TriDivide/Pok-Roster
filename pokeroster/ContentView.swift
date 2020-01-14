//
//  ContentView.swift
//  pokeroster
//
//  Created by Liam Smith on 14/01/2020.
//  Copyright © 2020 Liam Smith. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            
            Text("hello \(email)")
            Text("Your password is: \(password)")
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Login")
            }
        }

    }
    
// MARK: Logic
    private func doLogin() {
        guard email.count > 0 else {
            print("name not entered")
            return
        }
        
        guard password.count >= 6 else {
            print("Enter password")
            return
        }
// doLogin(email: String, password: String, completion: @escaping(Error?) -> Void)
        UserModel.instance.doLogin(email: email, password: password) {(error) in
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
