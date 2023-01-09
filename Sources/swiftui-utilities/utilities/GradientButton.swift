//
//  GradientButton.swift
//  
//
//  Created by Nikhil on 09/01/23.
//

import Foundation
import SwiftUI

public struct GradientButton: View {
    
    var title:String
    var width:Double = 300.0
    var fontSize:CGFloat = 15
    var height:Double = 44.0
    var action:() -> Void
    
    public init(title: String, width: Double, fontSize: CGFloat, height: Double, action: @escaping () -> Void) {
        self.title = title
        self.width = width
        self.fontSize = fontSize
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
                        .font(.system(size: fontSize))
            }
            .padding()
            .frame(minWidth:width)
            .frame(height:height)
        }
        .background(
            GradientView(firstColor: .black, secondColor: .white)
        ).cornerRadius(32)
            .padding()
    }
}
