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
        path.move(to: CGPoint(x: rect.midX - 100, y: rect.midY + 72))
        
        path.addCurve(to: CGPoint(x: rect.midX - 100, y: rect.midY - 72), control1: CGPoint(x: rect.midX - 200, y: rect.midY + 72), control2: CGPoint(x: rect.midX - 200, y: rect.midY - 72))
        path.addCurve(to: CGPoint(x: rect.midX + 100, y: rect.midY + 72), control1: CGPoint(x: rect.midX , y: rect.midY - 72), control2: CGPoint(x: rect.midX, y: rect.midY + 72))
        path.addCurve(to: CGPoint(x: rect.midX + 100, y: rect.midY - 72), control1: CGPoint(x: rect.midX + 200, y: rect.midY + 72), control2: CGPoint(x: rect.midX + 200, y: rect.midY - 72))
        
        path.addCurve(to: CGPoint(x: rect.midX - 100, y: rect.midY + 72), control1: CGPoint(x: rect.midX, y: rect.midY - 72), control2: CGPoint(x: rect.midX , y: rect.midY + 72))
        return path
    }
}
