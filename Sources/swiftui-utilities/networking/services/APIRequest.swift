//
//  RequestModel.swift
//  Dimitra
//
//  Created by Nikhil on 06/09/2022.
//

import Foundation

public struct APIRequest {
    
    public init(method: HTTPMethod, url: String, body: Encodable?) {
        self.method = method
        self.url = url
        self.body = body
    }
    
    let method: HTTPMethod
    let url: String
    let body:Encodable?
}
