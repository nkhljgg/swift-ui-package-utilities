//
//  APIResponse.swift
//  Dimitra
//
//  Created by Nikhil on 06/09/2022.
//

import Foundation

public struct APIPayloadResponse<T:Codable>: Codable{
    public let code:Int
    public let message:APIMessage
    public let success:Bool
    public let data:T
    
    public init(code: Int, message: APIMessage, success: Bool, data: T) {
        self.code = code
        self.message = message
        self.success = success
        self.data = data
    }
    
    public func getMessage() -> String {
        switch message {
        case .object(let wrapper):
            return wrapper.errors.map { $0.msg }.joined(separator:", ")
        case .string(let value):
            return value
        }
    }
}

// Message is not always string and could be an object too
public enum APIMessage: Codable {
    
    case object(MessageErrorWrapper), string(String)
    
     public init(from decoder: Decoder) throws {
        if let object = try? decoder.singleValueContainer().decode(MessageErrorWrapper.self) {
            self = .object(object)
            return
        }
        
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }
        
        throw APIMessageError.missingValue
    }
    
    enum APIMessageError:Error {
        case missingValue
    }
}

public struct MessageErrorWrapper: Codable {
    
    let errors:[MessageError]
    
    public init(errors: [MessageError]) {
        self.errors = errors
    }
    
    public struct MessageError: Codable {
        var value: String
        var msg: String
        var param: String
        var location: String
        
        public init(value: String, msg: String, param: String, location: String) {
            self.value = value
            self.msg = msg
            self.param = param
            self.location = location
        }
    }
}

public struct APIResponse : Codable{
    let code:Int
    let message:String
    let success:Bool
    
    public init(code: Int, message: String, success: Bool) {
        self.code = code
        self.message = message
        self.success = success
    }
}
