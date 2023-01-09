//
//  PopupView.swift
//  Firebase Chat
//
//  Created by Nikhil on 01/01/23.
//

import SwiftUI

public struct PopupView: View {
    
    var popupText: String
    
    public init(popupText: String) {
        self.popupText = popupText
    }
    
    public var body: some View {
        ZStack {
            Text(popupText)
                .font(.poppins)
                .padding(2.5)
                .frame(width: UIScreen.main.bounds.width - 100, height: 75)
//                .background {
//                RoundedRectangle(cornerRadius: 5)
//                    .fill(.white)
//                    .shadow(color: .black, radius: 2)
//
//                }
        }
    }
}
