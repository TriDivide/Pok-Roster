//
//  NeumorphicRoundedTextField.swift
//  pokeroster
//
//  Created by Liam Smith on 14/03/2020.
//  Copyright © 2020 Liam Smith. All rights reserved.
//

import SwiftUI

struct NeumorphicRoundedTextField: View {
    
    @State private var input: String
    private var placeholder: String
    private let width: CGFloat
    private let height: CGFloat
    private let radius: CGFloat
    private let alignment: Alignment
    
    init(input: State<String>, placeholder: String, width: CGFloat, height: CGFloat, radius: CGFloat, alignment: Alignment) {
        self._input = input
        self.placeholder = placeholder
        self.width = width
        self.height = height
        self.radius = radius
        self.alignment = alignment
    }
    
    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: radius)
            .fill(Color("Background"))
                .frame(width: self.width, height: self.height)
            .overlay(
                RoundedRectangle(cornerRadius: radius)
                    .stroke(Color("DarkShadow"), lineWidth: 4)
                    .blur(radius: 4)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: radius).fill(LinearGradient(Color("DarkShadow"), Color.clear)))
            ).overlay(
                RoundedRectangle(cornerRadius: radius)
                    .stroke(Color("LightShadow"), lineWidth: 8)
                    .blur(radius: 4)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: radius).fill(LinearGradient(Color.clear, Color("DarkShadow"))))
            )
            
            TextField(placeholder, text: $input)
                .frame(width: self.width - 20, height: self.height - 10, alignment: alignment)
        }.frame(width: self.width, height: self.height, alignment: .center)
    }
}
