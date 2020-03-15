//
//  NeumorphicRoundedTextButton.swift
//  pokeroster
//
//  Created by Liam Smith on 15/03/2020.
//  Copyright © 2020 Liam Smith. All rights reserved.
//

import SwiftUI

struct NeumorphicRoundedTextButton: View {
    
    private let labelText: String
    private let height: CGFloat
    private let width: CGFloat
    private let textColor: Color
    
    private let action: () -> Void
    
    init(text: String, height: CGFloat, width: CGFloat, textColor: Color, action: @escaping() -> Void) {
        self.labelText = text
        self.height = height
        self.width = width
        self.action = action
        self.textColor = textColor
    }
    
    var body: some View {
        Button(action: action, label: {
            Text(labelText).foregroundColor(textColor)
        }).buttonStyle(NeumorphicRoundedTextButtonStyle(width: self.width, height: self.height)).frame(width: width, height: height)
    }
}

