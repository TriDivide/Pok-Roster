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
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    Background()
                    RoundedNeumorphicCard(width: CGFloat(geometry.size.width * 0.9), height: CGFloat(geometry.size.height * 0.85), radius: 20)
                    VStack {
                        NeumorphicRoundedTextField(input: self.$email, placeholder: "Email", width: CGFloat(geometry.size.width * 0.7), height: 40, radius: 20, alignment: .leading)
                        
                        Spacer()
                            .frame(height: 20)
                        
                        NeumorphicRoundedSecureTextField(input: self.$password, placeholder: "Password", width: CGFloat(geometry.size.width * 0.7), height: 40, radius: 20, alignment: .leading)
                        
                        NeumorphicRoundedTextButton(text: "Login", action: {
                            self.doLogin()
                        })
                        
                        NavigationLink(destination: SignupView()) {
                            Text("Sign Up")
                        }
                    }
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
