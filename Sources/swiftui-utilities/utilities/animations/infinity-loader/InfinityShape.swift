//
//  InfinityShape.swift
//  
//
//  Created by Nikhil on 05/02/23.
//

import Foundation
import SwiftUI

struct InfinityShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX - 40, y: rect.midY + 28.8))
        
        path.addCurve(to: CGPoint(x: rect.midX - 40, y: rect.midY - 28.8), control1: CGPoint(x: rect.midX - 80, y: rect.midY + 28.8), control2: CGPoint(x: rect.midX - 80, y: rect.midY - 28.8))
        path.addCurve(to: CGPoint(x: rect.midX + 40, y: rect.midY + 28.8), control1: CGPoint(x: rect.midX , y: rect.midY - 28.8), control2: CGPoint(x: rect.midX, y: rect.midY + 28.8))
        path.addCurve(to: CGPoint(x: rect.midX + 40, y: rect.midY - 28.8), control1: CGPoint(x: rect.midX + 80, y: rect.midY + 28.8), control2: CGPoint(x: rect.midX + 80, y: rect.midY - 28.8))
        
        path.addCurve(to: CGPoint(x: rect.midX - 40, y: rect.midY + 28.8), control1: CGPoint(x: rect.midX, y: rect.midY - 28.8), control2: CGPoint(x: rect.midX , y: rect.midY + 28.8))
        return path
    }
}
