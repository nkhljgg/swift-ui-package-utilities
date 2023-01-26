//
//  TextValidator.swift
//  SwiftUI Utilities
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import Combine
import SwiftUI

public enum FormRules {
    case noRule
    case notEmpty
    case maxLength(Int)
    case minLength(Int)
    case email
    case required
}

public class FormTextModel: ObservableObject {
    
    var manager = AppearanceManager()
    
    @Published public var text = ""
    @Published public var errorMessage = ""
    @Published public var isValid = true
    @Published public var observedValidity = true
    @Published public var color = Color.clear
    
    @Published var rules:[FormRules]
    public var name:String
    public var cancellables = Set<AnyCancellable>()
    
    public init(name:String = "", rules:[FormRules] = []) {
        self.name = name
        self.rules = rules
        
        $isValid
            .map { [self] in $0 ? manager.theme.formLabel : manager.theme.formError }
            .assign(to: &$color)
        
        $text
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink { [weak self] value in
                guard let self = self else { return }
                self.updateValidity(text:value)
            }.store(in: &cancellables)
    }
    
    public func updateValidity(text:String) {
        var validityStatus = true
        var validityMessage = [String]()
        for rule in rules {
            switch rule {
            case .noRule:
                validityStatus =  true
            case .minLength(let length):
                validityStatus =  text.count >= length
                validityMessage.append("Min length should be \(length)")
            case .maxLength(let length):
                validityStatus =  text.count <= length
                validityMessage.append("Max length should be \(length)")
            case .email:
                validityStatus = isValidEmail(text)
                validityMessage.append("Invalid Email")
            case .required:
                validityStatus = !text.isEmpty
                validityMessage.append("Required field \(name)")
            default:
                validityStatus = true
            }
        }
        self.observedValidity = validityStatus
    }
    
    fileprivate func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
