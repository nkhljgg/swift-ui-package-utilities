//
//  GradientView.swift
//  
//
//  Created by Nikhil on 09/01/23.
//

import Foundation
import SwiftUI

public struct GradientView:View {
    
    var colors: [Color]
    var direction: GradientDirection
    
    public enum GradientDirection {
        case topToBottom
        case leftToRight
    }
    
    ///Enter colors in sequence.
    public init(colors: [Color], direction: GradientDirection) {
        self.colors = colors
        self.direction = direction
    }
    
    func calculateDirection(_ direction: GradientDirection) -> [UnitPoint] {
        var coordinates = [UnitPoint]()
        
        switch direction {
        case .topToBottom:
            coordinates.append(.top)
            coordinates.append(.bottom)
        case .leftToRight:
            coordinates.append(.leading)
            coordinates.append(.trailing)
        }
        return coordinates
    }
    
    public var body: some View {
        
        LinearGradient(colors: colors, startPoint: calculateDirection(direction)[0], endPoint: calculateDirection(direction)[1])
        
    }
}
