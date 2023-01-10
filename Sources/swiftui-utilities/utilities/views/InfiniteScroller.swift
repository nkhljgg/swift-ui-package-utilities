//
//  InfiniteScroller.swift
//  
//
//  Created by Nikhil on 10/01/23.
//

import Foundation
import SwiftUI

public struct InfiniteScroller<Content: View>: View {
    var contentWidth: CGFloat
    var content: (() -> Content)
    
    @State
    var xOffset: CGFloat

    public init(contentWidth: CGFloat, content: @escaping () -> Content, xOffset: CGFloat = 0) {
        self.contentWidth = contentWidth
        self.content = content
        self.xOffset = xOffset
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    content()
                    content()
                }
                .offset(x: xOffset, y: 0)
        }
        .disabled(false)
        .onAppear {
            withAnimation(.linear(duration: 5).repeatForever(autoreverses: true)) {
                xOffset = -contentWidth
            }
        }
    }
}
