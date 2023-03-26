//
//  ColorOptions.swift
//  Task List
//
//  Created by Nikhil on 26/03/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct ColorOptions {
    public static var all: [Color] = [
        .primary,
        .gray,
        .red,
        .orange,
        .yellow,
        .green,
        .mint,
        .cyan,
        .indigo,
        .purple,
    ]
    
    public static var `default` : Color = Color.primary
    
    public static func random() -> Color {
        if let element = ColorOptions.all.randomElement() {
            return element
        } else {
            return .primary
        }
        
    }
}
