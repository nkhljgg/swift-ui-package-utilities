//
//  FormTextViewWithRightAction.swift
//  SwiftUI Utilities
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import SwiftUI

public struct FormTextViewWithRightAction: View {
    var manager = AppearanceManager()
    var title:String
    var placeHolder:String
    @ObservedObject var validator:FormTextModel
    var inputType:UIKeyboardType
    var rightActionTitle:Binding<String>
    var rightAction:() -> Void
    
    var displayAdditionalInfo: (() -> Void)?
    var hasAdditionalInfo = false
    var additionalInfoText: String
    @Binding var showAdditionalInfo: Bool
    
    public init(title:String,
         placeholder:String,
         validator:FormTextModel,
         inputType:UIKeyboardType = .default,
         rightActionTitle:Binding<String>,
         hasAdditionalInfo: Bool = false,
         displayAdditionalInfo: (() -> Void)? = nil,
         showInfo: Binding<Bool> = .constant(false),
         additionalInfoText: String = "",
         rightAction:@escaping () -> Void) {
        
        self.title = title
        self.placeHolder = placeholder
        self.validator = validator
        self.rightActionTitle = rightActionTitle
        self.inputType = inputType
        self.rightAction = rightAction
        
        self.hasAdditionalInfo = hasAdditionalInfo
        self.displayAdditionalInfo = displayAdditionalInfo
        self._showAdditionalInfo = showInfo
        self.additionalInfoText = additionalInfoText
    }
    
    public var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.poppinsHeadline)
                    .foregroundColor(validator.color)
                if hasAdditionalInfo {
                    Button {
                        if let additionalInfoFunction = displayAdditionalInfo {
                            additionalInfoFunction()
                        }
                    } label: {
                        Image("info")
                    }
                    .popover(isPresented: $showAdditionalInfo) {
                        PopupView(popupText: additionalInfoText).onTapGesture {
                            showAdditionalInfo.toggle()
                        }
                    }
                }
                Spacer()
                HStack {
                    Text(rightActionTitle.wrappedValue)
                        .font(.poppinsCaption)
                    Image(systemName: "pencil")
                        .foregroundColor(manager.theme.formLinkText)
                }.onTapGesture {
                    rightAction()
                }
            }
            FormFieldWrapper(content: {
                Divider()
                    .frame(maxWidth:1.0, maxHeight: 20)
                    .background(validator.color)
                TextField(placeHolder, text: $validator.text)
                    .font(.poppins)
                    .foregroundColor(manager.theme.formControlText)
                    .multilineTextAlignment(.leading)
                    .keyboardType(inputType)
            },validator: validator)
        }
    }
}
