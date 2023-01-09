//
//  UIColor.swift
//  Firebase Chat
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import UIKit

public extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

public extension UIColor {
    
    static var appBackgroundColor: UIColor {
        return UIColor(hexString: "#F6F5F5")
    }
    
    static var appLightGreen: UIColor {
        return UIColor(hexString: "#0EBF67")
    }
    
    static var appDarkGreen: UIColor {
        return UIColor(hexString: "#117443")
    }
    
    static var helpDeskNavigationItemBorder: UIColor {
        return UIColor(hexString: "#9EB1CA")
    }
}

