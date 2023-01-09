//
//  DefaultTheme.swift
//  Firebase Chat
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import SwiftUI

public struct DefaultTheme: Theme {
    
    public init () { }
    
    public var primary: Color = Color(hex: 0x117443)
    
    public var accent: Color = Color(hex: 0x117443)
    
    public var secondary: Color = Color(hex: 0x0EBF67)
    
    public var border: Color = Color(hex: 0x818080)
    
    public var background: Color = Color(hex:0xF0F1F2)
    
    public var dashboardBackground: Color = Color(hex: 0xE5FFF2)
    
    public var textBlack: Color = Color(hex: 0x383838)
    
    public var textLight: Color = Color(hex: 0x494949)
    
    public var textDarkGray: Color = Color(hex: 0x282a2b)
    
    // MARK: - Forms
    
    public var formError: Color = Color.red
    
    public var formLabel: Color = Color.black
    
    public var formControlText: Color = Color.black
    
    public var formPlaceHolderText: Color = Color(hex: 0x8c8c8c)
    
    public var formBorder: Color = Color(hex:0xC6C6C6)
    
    public var formLinkText: Color = Color(hex: 0x0EBF67)
    
    // MARK: - Forms End
    
    public var cardViewBackground: Color = Color.white
}

