//
//  DashboardView.swift
//  pokeroster
//
//  Created by Liam Smith on 16/01/2020.
//  Copyright © 2020 Liam Smith. All rights reserved.
//

import SwiftUI

struct DashboardView: View {
    
    var body: some View {
        VStack {
            Text("Dashboard page")
            Button(action: {
                UserModel.instance.doLogout() { error in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }) {
                Text("Logout")
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
