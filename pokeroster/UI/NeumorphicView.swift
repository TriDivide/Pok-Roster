//
//  NeumorphicView.swift
//  pokeroster
//
//  Created by Liam Smith on 13/03/2020.
//  Copyright © 2020 Liam Smith. All rights reserved.
//

import SwiftUI

struct NeumorphicView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                RoundedRectangle(cornerRadius: 20)
                .fill(Color("Background"))
                .frame(width: 300, height: 180)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("DarkShadow"), lineWidth: 4)
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
                
                RoundedNeumorphicCard(width: 200, height: 100, radius: 20)
                
                NeumorphicCircle(width: 100, height: 100)
                

            }
        }
    }
}

struct NeumorphicView_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicView()
    }
}
