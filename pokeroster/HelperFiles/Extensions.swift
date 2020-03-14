//
//  Extensions.swift
//  pokeroster
//
//  Created by Liam Smith on 13/03/2020.
//  Copyright © 2020 Liam Smith. All rights reserved.
//

import Foundation
import SwiftUI


extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
