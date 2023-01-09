//
//  FormFieldWrapper.swift
//  SwiftUI Utilities
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import SwiftUI

struct FormFieldWrapper<Content:View>:View {
    @ViewBuilder var content:Content
    @StateObject var validator:FormTextModel
    
    var radius:Int = 20
    var shadowColor = Color.gray.opacity(0.3)
    var shadowRadius = 4
    var backgroundColor = Color.white
    
    var body: some View {
        HStack {
            Spacer().frame(width:16)
            content
            Spacer().frame(width:16)
        }
        .frame(minHeight:40.0)
        .cornerRadius(4.0)
        .overlay(
            RoundedRectangle(cornerRadius: 4.0)
                .stroke(validator.color, lineWidth: 0.5)
        )
    }
    
}
