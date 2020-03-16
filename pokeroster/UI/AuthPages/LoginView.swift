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
    
    @State private var isNavigationBarHidden: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
           NavigationView {
                ZStack(alignment: .center) {
                    Background()
                    RoundedNeumorphicCard(width: CGFloat(geometry.size.width * 0.9), height: CGFloat(geometry.size.height * 0.90), radius: 20)
                    
                    VStack {
                        Spacer()
                        NeumorphicRoundedTextField(input: self.$email, placeholder: "Email", width: CGFloat(geometry.size.width * 0.7), height: 40, radius: 20, alignment: .leading)
                        
                        Spacer()
                            .frame(height: 20)
                        
                        NeumorphicRoundedSecureTextField(input: self.$password, placeholder: "Password", width: CGFloat(geometry.size.width * 0.7), height: 40, radius: 20, alignment: .leading)
                        
                        Spacer()
                            .frame(height: 100)
                        
                        NeumorphicRoundedTextButton(text: "Login", height: 50, width: CGFloat(geometry.size.width * 0.7), action: {
                            self.doLogin()
                        })
                        
                        Spacer()
                            .frame(height: 20)
                        
                        NavigationLink(destination: SignupView()) {
//                            NeumorphicRoundedTextButton(text: "Sign up", height: 50, width: CGFloat(geometry.size.width * 0.7), action: {
//                                print("navigating to signupView")
//
//                            })
                            
                            Text("SignUp")
                        }
                        Spacer()
                            .frame(height: CGFloat(geometry.size.height * 0.1))
                    }
                }
                .navigationBarTitle("Hidden Title")
                .navigationBarHidden(self.isNavigationBarHidden)
                .onAppear {
                    self.isNavigationBarHidden = true
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
