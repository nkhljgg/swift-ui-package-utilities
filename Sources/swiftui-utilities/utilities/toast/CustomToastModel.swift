//
//  CustomToastModel.swift
//
//  Created by Nikhil on 29/01/23.
//

import Foundation
import SwiftUI

public struct CustomToast: Equatable {
    var type: CustomToastStyle
    var title: String
    var message: String
    var duration: Double
    
    public init(type: CustomToastStyle, title: String, message: String, duration: Double = 3) {
        self.type = type
        self.title = title
        self.message = message
        self.duration = duration
    }
    
}


public enum CustomToastStyle {
    case error
    case warning
    case success
    case info
}

public extension CustomToastStyle {
    var themeColor: Color {
        switch self {
        case .error: return Color.red
        case .warning: return Color.orange
        case .info: return Color.blue
        case .success: return Color.green
        }
    }
    
    var iconFileName: String {
        switch self {
        case .info: return "info.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .success: return "checkmark.circle.fill"
        case .error: return "xmark.circle.fill"
        }
    }
}
