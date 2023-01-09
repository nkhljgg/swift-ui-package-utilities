//
//  GradientButton.swift
//  
//
//  Created by Nikhil on 09/01/23.
//

import Foundation
import SwiftUI

public struct GradientButton: View {
    
    var title: String
    var width: Double
    var font: Font
    var height: Double
    var action: () -> Void
    
    public init(title: String, width: Double = 300.0, font: Font = .poppinsSubHeadlineSemiBold, height: Double = 45.0, action: @escaping () -> Void) {
        self.title = title
        self.width = width
        self.font = font
        self.height = height
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            VStack {
                    Text(NSLocalizedString(title, comment: ""))
                        .font(.poppinsTitle1)
                        .foregroundColor(Color.white)
                        .lineLimit(nil)
            }
            .padding()
            .frame(minWidth:width)
            .frame(height:height)
        }
        .background(
            GradientView(colors: [.white, .black], direction: .topToBottom)
        ).cornerRadius(32)
            .padding()
    }
}
