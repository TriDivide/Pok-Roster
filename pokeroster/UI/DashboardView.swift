//
//  DashboardView.swift
//  pokeroster
//
//  Created by Liam Smith on 16/01/2020.
//  Copyright © 2020 Liam Smith. All rights reserved.
//

import SwiftUI

struct DashboardView: View {
    @State private var notLoggedIn = false
    
    var body: some View {
        VStack {
        Text(notLoggedIn ? "You are currently logged in" : "You are not signed in")
        }.onAppear(perform: {
            self.isSignedIn()
        }).sheet(isPresented: $notLoggedIn) {
            LoginView()
        }
    }
    
    private func isSignedIn() {
        notLoggedIn = UserModel.instance.isLoggedIn()
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
