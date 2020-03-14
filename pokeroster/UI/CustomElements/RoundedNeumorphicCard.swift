//
//  RoundedNeumorphicCard.swift
//  pokeroster
//
//  Created by Liam Smith on 14/03/2020.
//  Copyright © 2020 Liam Smith. All rights reserved.
//

import SwiftUI

struct RoundedNeumorphicCard: View {
    
    private let width: CGFloat
    private let height: CGFloat
    private let radius: CGFloat
    
    init(width: CGFloat, height: CGFloat, radius: CGFloat) {
        self.width = width
        self.height = height
        self.radius = radius
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: radius)
        .fill(Color("Background"))
        .frame(width: width, height: height)
        .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
        .shadow(color:Color("DarkShadow"), radius: 8, x: 8, y: 8)
    }
}

