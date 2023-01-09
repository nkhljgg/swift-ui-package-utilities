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
        case diagonal(direction: DiagonalDirections)
    }
    
    public enum DiagonalDirections {
        case topLeftToBottomRight
        case topRightToBottomLeft
        case bottomLeftToTopRight
        case bottomRightToTopLeft
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
        case .diagonal(direction: let direction):
            switch direction {
            case .topLeftToBottomRight:
                coordinates.append(.topLeading)
                coordinates.append(.bottomTrailing)
            case .topRightToBottomLeft:
                coordinates.append(.topTrailing)
                coordinates.append(.bottomLeading)
            case .bottomLeftToTopRight:
                coordinates.append(.bottomLeading)
                coordinates.append(.topTrailing)
            case .bottomRightToTopLeft:
                coordinates.append(.bottomTrailing)
                coordinates.append(.topLeading)
            }
        }
        return coordinates
    }
    
    public var body: some View {
            LinearGradient(colors: colors, startPoint: calculateDirection(direction)[0], endPoint: calculateDirection(direction)[1])
                .edgesIgnoringSafeArea(.all)
    }
}
