//
//  NeumorphicButton.swift
//  pokeroster
//
//  Created by Liam Smith on 14/03/2020.
//  Copyright © 2020 Liam Smith. All rights reserved.
//

import SwiftUI

struct NeumorphicButton: View {

    private let text: String
    init(text: String) {
        self.text = text
    }
    
    
    var body: some View {
        Button( action: {
            print("Button tapped")
        }) {
            Text("Press me!")
        }
    .buttonStyle(NeumorphicRoundedButtonStyle())
    }
}

