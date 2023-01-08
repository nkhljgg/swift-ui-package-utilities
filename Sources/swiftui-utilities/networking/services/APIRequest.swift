//
//  RequestModel.swift
//  Dimitra
//
//  Created by Nikhil on 06/09/2022.
//

import Foundation

public struct APIRequest {
    let method: HTTPMethod
    let endpoint: String
    let body:Encodable?
}
