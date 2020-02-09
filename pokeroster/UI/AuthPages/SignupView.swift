//
//  SignupView.swift
//  pokeroster
//
//  Created by Liam Smith on 16/01/2020.
//  Copyright © 2020 Liam Smith. All rights reserved.
//

import SwiftUI

struct SignupView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var errorMessage: String = "ErrorMessage"
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Username", text: $name)
                TextField("Email Address", text: $email)
                SecureField("Password", text: $password)
                
                Button(action: {
                    self.doSignUp()
                }) {
                    Text("Login")
                }.alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("Ok")))

                }
            }
        }
    }
    
    private func doSignUp() {
        self.showAlert = false
        guard name.count > 0 else {
            self.errorMessage = "Please enter your Username"
            self.showAlert = true
            return
        }
        
        guard email.count > 0 else {
            self.errorMessage = "Please enter your email address"
            self.showAlert = true
            return
        }
        
        guard password.count >= 6 else {
            self.errorMessage = "Please enter a password six letters or longer"
            self.showAlert = true
            return
        }
        
        UserModel.instance.doSignUpAndLogin(username: self.name, email: self.email, password: self.password) { (error) in
            if let error = error {
                self.errorMessage = error.localizedDescription
                self.showAlert = true
                return
            }
            
        }
        
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
