//
//  RootView.swift
//  pokeroster
//
//  Created by Liam Smith on 20/01/2020.
//  Copyright © 2020 Liam Smith. All rights reserved.
//

import SwiftUI

struct RootView: View {
    
    @State var isLoggedIn = false
    
    var body: some View {
        
        Group {
            isLoggedIn ? AnyView(DashboardView()) : AnyView(LoginView())
        }.onReceive(UserModel.instance.loginStatus) {
            self.isLoggedIn = $0
        }.onAppear(perform: {
            let _ = UserModel.instance.isLoggedIn()
        })
    }
}
