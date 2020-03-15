//
//  Background.swift
//  pokeroster
//
//  Created by Liam Smith on 14/03/2020.
//  Copyright © 2020 Liam Smith. All rights reserved.
//

import SwiftUI

struct Background: View {
    var body: some View {
        Rectangle()
            .fill(Color("Background"))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        
    }
}
