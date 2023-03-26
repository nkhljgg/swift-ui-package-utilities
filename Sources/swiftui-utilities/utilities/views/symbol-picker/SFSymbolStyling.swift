//
//  SFSymbolStyling.swift
//  Task List
//
//  Created by Nikhil on 26/03/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct SFSymbolStyling: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .imageScale(.large)
            .symbolRenderingMode(.monochrome)
    }
}

@available(iOS 15.0, *)
public extension View {
    func sfSymbolStyling() -> some View {
        modifier(SFSymbolStyling())
    }
}
