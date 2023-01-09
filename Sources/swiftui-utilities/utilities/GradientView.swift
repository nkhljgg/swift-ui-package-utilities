//
//  GradientView.swift
//  
//
//  Created by Nikhil on 09/01/23.
//

import Foundation
import SwiftUI

public struct GradientView:View {
    
    var firstColor: UIColor
    var secondColor: UIColor
    
    public init(firstColor: UIColor, secondColor: UIColor) {
        self.firstColor = firstColor
        self.secondColor = secondColor
    }
    
    public var body: some View {
        LinearGradient(gradient:
                        Gradient(colors: [Color(firstColor),
                                          Color(secondColor)]),
                       startPoint: .leading,
                       endPoint: .trailing)
    }
}
