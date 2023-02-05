//
//  Color.swift
//  Firebase Chat
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import SwiftUI

public extension Color {
    
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
    
    init(hex: String) {
        self.init(UIColor(hexString: hex))
    }
    
    init(r: Double, g: Double, b: Double) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0)
    }
    
    static let materialBlack: Color = Color(r: 18, g: 18, b: 18)
    
}
