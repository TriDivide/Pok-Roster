//
//  ContentView.swift
//  pokeroster
//
//  Created by Liam Smith on 14/01/2020.
//  Copyright © 2020 Liam Smith. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var result: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
                Button(action: {
                    self.doLogin()
                }) {
                    Text("Login")
                }
                
                NavigationLink(destination: SignupView()) {
                    Text("Sign Up")
                }
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
        UserModel.instance.doLogin(email: email, password: password) {(error) in
            if let error = error {
                self.result = error.localizedDescription
                return
            }
            
            self.result = "Successfully logged in!!!"
            
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
