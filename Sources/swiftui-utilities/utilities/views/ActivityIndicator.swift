//
//  ActivityIndicator.swift
//  
//
//  Created by Nikhil on 15/01/23.
//

import Foundation
import SwiftUI

public struct ActivityIndicator: UIViewRepresentable {
    
    public typealias UIView = UIActivityIndicatorView
    var isAnimating: Bool
    var configuration = { (indicator: UIView) in }

    public func makeUIView(context: UIViewRepresentableContext<Self>) -> UIView { UIView() }
    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Self>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        configuration(uiView)
    }
}

public extension View where Self == ActivityIndicator {
    func configure(_ configuration: @escaping (Self.UIView)->Void) -> Self {
        Self.init(isAnimating: self.isAnimating, configuration: configuration)
    }
}

public struct ActivityIndicatorView: View {
    var isAnimating: Bool
    
    public init(isAnimating: Bool) {
        self.isAnimating = isAnimating
    }
    
    public var body: some View {
        ActivityIndicator(isAnimating: isAnimating)
            .configure {
                $0.color = .black
                $0.style = .large
            }.padding(50)
        
    }
}

/*
 MARK: - Usage
 
 if dataIsLoading {
     Color.black.opacity(0.2).ignoresSafeArea()
     ActivityIndicatorView(isAnimating: dataIsLoading)
 }

 */
