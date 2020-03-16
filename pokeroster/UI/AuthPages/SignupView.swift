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
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    Background()
                    RoundedNeumorphicCard(width: CGFloat(geometry.size.width * 0.8), height: CGFloat(geometry.size.height * 0.8), radius: 20)
                    VStack {
                        Spacer()
                        NeumorphicRoundedTextField(input: self.$name, placeholder: "Username", width: CGFloat(geometry.size.width * 0.7), height: 40, radius: 20, alignment: .leading)
                        
                        Spacer().frame(height: 20)
                        
                        NeumorphicRoundedTextField(input: self.$email, placeholder: "Email Address", width: CGFloat(geometry.size.width * 0.7), height: 40, radius: 20, alignment: .leading)
                        
                        Spacer().frame(height: 20)

                        NeumorphicRoundedSecureTextField(input: self.$password, placeholder: "Password", width: CGFloat(geometry.size.width * 0.7), height: 40, radius: 20, alignment: .leading)
                        
                        Spacer().frame(height: 60)

                        NeumorphicRoundedTextButton(text: "Submit", height: 60, width: CGFloat(geometry.size.width * 0.7), action: {
                            self.doSignUp()
                        })
//                            .alert(isPresented: self.$showAlert) {
//                            Alert(title: Text("Error"), message: Text(self.errorMessage), dismissButton: .default(Text("Ok")))
//                        }
                        
                        Spacer().frame(height: CGFloat(geometry.size.height * 0.1))
                    }
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
