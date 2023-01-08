//
//  RequestModel.swift
//  Dimitra
//
//  Created by Nikhil on 06/09/2022.
//

import Foundation

public struct APIRequest {
    
    public init(method: HTTPMethod, endpoint: String, body: Encodable?) {
        self.method = method
        self.endpoint = endpoint
        self.body = body
    }
    
    let method: HTTPMethod
    let endpoint: String
    let body:Encodable?
}
