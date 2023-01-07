//
//  CardView.swift
//  
//
//  Created by Nikhil on 07/01/23.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
public struct CardView<Content:View>:View {
    
    public init(radius: Int = 12, shadowColor: Color = Color.black.opacity(0.3),shadowRadius: Int = 4,backgroundColor: Color = .white, shouldExpand: Bool = true, padding: CGFloat = 16.0, @ViewBuilder content: @escaping () -> Content) {
        
        self.radius = radius
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.backgroundColor = backgroundColor
        self.shouldExpand = shouldExpand
        self.padding = padding
        self.content = content
    }
    
    var radius:Int = 12
    var shadowColor = Color.black.opacity(0.3)
    var shadowRadius = 4
    var backgroundColor = Color.white
    var shouldExpand = true
    var padding = 16.0
    let content: () -> Content
    
    public var body: some View {
        ZStack {
            if shouldExpand {
                VStack {
                    content()
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(minHeight: 0, maxHeight:  .infinity)
                .padding(padding)
                .background(backgroundColor)
                .cornerRadius(CGFloat(radius))
                .shadow(color: shadowColor, radius: CGFloat(shadowRadius), x: 0, y: 0)
            } else {
                VStack {
                    content()
                }
                .padding()
                .background(backgroundColor)
                .cornerRadius(CGFloat(radius))
                .shadow(color: shadowColor, radius: CGFloat(shadowRadius), x: 0, y: 0)
            }
        }
    }
}

