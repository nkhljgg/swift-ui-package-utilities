//
//  Fonts+Poppins.swift
//  
//
//  Created by Nikhil on 09/01/23.
//

import Foundation
import SwiftUI

/*
 TIP:
 Fonts filename and Fonts name used inside the application must be same.
 Otherwise custom font won't load without showing any error.
 */
public enum Poppins: String, CaseIterable {
    case regular = "Poppins-Regular"
    case italic = "Poppins-Regular-Italic"
    case medium = "Poppins-Medium"
    case bold = "Poppins-Bold"
    case semibold = "Poppins-SemiBold"
}

public extension Font.TextStyle {
    var size: CGFloat {
        switch self {
        case .largeTitle: return 60
        case .title: return 48
        case .title2: return 32
        case .title3: return 16
        case .headline: return 14
        case .body: return 13
        case .subheadline, .callout: return 16
        case .footnote: return 14
        case .caption: return 12
        case .caption2: return 11
        @unknown default:
            return 8
        }
    }
}

public extension Font {
    private static func custom(_ font: Poppins, relativeTo style: Font.TextStyle) -> Font {
        if #available(iOS 14.0, *) {
           return custom(font.rawValue, size: style.size, relativeTo: style)
        } else {
            return custom(font.rawValue, size: style.size)
            
        }
    }

    static let poppins = custom(.regular, relativeTo: .body)
    static let poppinsLargeTitle = custom(.bold, relativeTo: .largeTitle)
    static let poppinsLargeTitleSemiBold = custom(.medium, relativeTo: .largeTitle)
    static let poppinsTitle1 = custom(.bold, relativeTo: .title)
    static let poppinsHeadline = custom(.medium, relativeTo: .headline)
    static let poppinsSubHeadline = custom(.regular, relativeTo: .subheadline)
    static let poppinsSubHeadlineItalic = custom(.italic, relativeTo: .subheadline)
    static let poppinsSubHeadlineSemiBold = custom(.medium, relativeTo: .subheadline)
    static let poppinsFootnote = custom(.regular, relativeTo: .footnote)
    static let poppinsFootnoteSemiBold = custom(.medium, relativeTo: .footnote)
    static let poppinsCaption = custom(.regular, relativeTo: .caption)
    
    @available(iOS 14.0, *)
    static let poppinsCaption2 = custom(.italic, relativeTo: .caption2)
    
    @available(iOS 14.0, *)
    static let poppinsTitle2 = custom(.medium, relativeTo: .title2)
    
    @available(iOS 14.0, *)
    static let poppinsTitle3 = custom(.bold, relativeTo: .title3)
}
