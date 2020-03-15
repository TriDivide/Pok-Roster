//
//  NeumorphicRoundedTextButtonStyle.swift
//  pokeroster
//
//  Created by Liam Smith on 15/03/2020.
//  Copyright © 2020 Liam Smith. All rights reserved.
//

import SwiftUI

struct NeumorphicRoundedTextButtonStyle: ButtonStyle {

    private let width: CGFloat
    private let height: CGFloat
    
    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
        .padding(30)
        .background(
            Group {
                if configuration.isPressed {
                    RoundedRectangle(cornerRadius: 20)
                    .fill(Color("Background"))
                    .frame(width: self.width, height: self.height)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("DarkShadow"), lineWidth: 8)
                            .blur(radius: 4)
                            .offset(x: 2, y: 2)
                            .mask(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(Color("DarkShadow"), Color.clear)))
                    ).overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("LightShadow"), lineWidth: 8)
                            .blur(radius: 4)
                            .offset(x: -2, y: -2)
                            .mask(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(Color.clear, Color("DarkShadow"))))
                    )
                } else {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("Background"))
                        .frame(width: self.width, height: self.height)
                        .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                        .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
                }
            }
        )
    }
}
