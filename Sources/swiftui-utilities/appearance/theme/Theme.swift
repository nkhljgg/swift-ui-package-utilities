//
//  Theme.swift
//  Firebase Chat
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import SwiftUI

public protocol Theme {
    var primary: Color { get set }
    
    var accent: Color { get set }
    
    var secondary: Color { get set }
    
    var border: Color { get set }
    
    var background: Color { get set }
    
    var dashboardBackground: Color { get set }
    
    var textBlack: Color { get set }
    
    var textLight: Color { get set }
    
    var textDarkGray: Color { get set }
    
    // MARK: - Forms
    
    var formError: Color { get set }
    
    var formLabel: Color { get set }
    
    var formControlText: Color { get set }
    
    var formPlaceHolderText: Color { get set }
    
    var formBorder: Color { get set }
    
    var formLinkText: Color { get set }
    
    // MARK: - Forms End
    
    var cardViewBackground: Color { get set }
}



