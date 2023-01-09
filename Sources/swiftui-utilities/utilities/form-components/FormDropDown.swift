//
//  FormDropdown.swift
//  SwiftUI Utilities
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import SwiftUI

public struct FormDropDown:View {
    
    var manager = AppearanceManager()
    var title:String
    var placeHolder:String
    var action:() -> Void
    
    @ObservedObject var validator:FormTextModel
    
    public init(title:String, placeholder:String,
         validator:FormTextModel,
         action:@escaping () -> Void) {
        self.title = title
        self.placeHolder = placeholder
        self.validator = validator
        self.action = action
    }
    
    public var body: some View {
        VStack {
            Text(title)
                .font(.poppinsHeadline)
                .frame(maxWidth:.infinity, alignment:.leading)
                .foregroundColor(validator.color)
            FormFieldWrapper(content: {
                HStack {
                    if validator.text == "" {
                        Text(placeHolder)
                            .font(.poppins)
                            .foregroundColor(manager.theme.formPlaceHolderText)
                            .frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
                    } else {
                        Text(validator.text).lineLimit(nil)
                            .font(.poppins)
                            .foregroundColor(manager.theme.formControlText)
                            .frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                    }
                    Spacer()
                    Image(systemName: "arrowtriangle.down.fill")
                        .resizable()
                        .frame(width: 8, height: 8, alignment: .center)
                }
            }, validator: validator)
            .background(Color.white.opacity(0.01))
            .onTapGesture {
                action()
            }
            /*
             ### WORKAROUND: SwiftUI issue ###
             - Background is set with opacity 0.01 as a workaround for this issue
             - No TapGesture detected in Spacer inside HStack
             - I may try using ZStack later and see if solves the issue
             */
        }
    }
}
