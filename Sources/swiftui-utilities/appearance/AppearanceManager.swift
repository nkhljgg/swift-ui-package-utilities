//
//  AppearanceManager.swift
//  Firebase Chat
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import Combine
import SwiftUI

/*
 
 Form Notes - Caption2
 - 11px 400 black
 
 Form Label - Headline
 - 14px 600 black
 
 Form PlaceHolder - Body
 - 13px 400 0x8C8C8C
 
 Form Control Text - Body
 - 13px 400 black
 
 Form border color
 - 0xC6C6C6
 
 Secondary Grey
 - 0xEDECEC
 
 Form Right Title
 - 12 px 400 secondary - Caption1
 */

public class AppearanceManager:ObservableObject {
    @Published public var theme:Theme = DefaultTheme()
    
    public init() { }
    
    public func titleText(_ text: String) -> Text {
        return Text(text)
            .font(.poppinsHeadline)
            .fontWeight(.bold)
            .foregroundColor(theme.primary)
    }
    
    public func secondaryText(_ text: String) -> Text {
        return Text(text)
            .font(.poppinsTitle1)
            .fontWeight(.regular)
            .foregroundColor(theme.primary)
    }
    
    public func buttonText(_ text: String) -> Text {
        return Text(text)
            .font(.poppinsCaption)
            .fontWeight(.medium)
            .foregroundColor(theme.primary)
    }
    
    // MARK: - Forms
    public func textFormNote(_ text: String) -> Text {
        if #available(iOS 14.0, *) {
            return Text(text)
                .font(.poppinsCaption2)
                .foregroundColor(theme.textBlack)
        } else {
            return Text(text)
                .font(.poppinsCaption)
                .foregroundColor(theme.textBlack)
        }
    }
    
    public func textFormLabel(_ text: String) -> Text {
        return Text(text)
            .font(.poppinsHeadline)
            .foregroundColor(theme.formLabel)
    }
    
    public func textFormPlaceHolder(_ text: String) -> Text {
        return Text(text)
            .font(.poppins)
            .foregroundColor(theme.formPlaceHolderText)
    }
    
    public func textFormControlText(_ text: String) -> Text {
        return Text(text)
            .font(.poppins)
            .foregroundColor(theme.formControlText)
    }
    
    public func textFormSubsidiaryLabel(_ text: String) -> Text {
        return Text(text)
            .font(.poppinsCaption)
            .foregroundColor(theme.formLinkText)
    }
    
    // MARK: - Forms end
    
    // MARK: - Register Fonts
    public static func registerFonts() {
        Poppins.allCases.forEach {
            registerFont(bundle: .main, fontName: $0.rawValue, fontExtension: "ttf")
        }
    }
    
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        
        var error: Unmanaged<CFError>?
        
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
    
    // MARK: - Register Fonts end
}
