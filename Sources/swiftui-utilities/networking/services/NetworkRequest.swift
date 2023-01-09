//
//  NetworkRequest.swift
//  Dimitra
//
//  Created by Nikhil on 06/09/2022.
//

import Foundation

/**
        Defines a network requests
 */
public struct NetworkRequest{
    
    let url:String
    let headers:[String:String]?
    let body:Data?
    let requestTimeOut:Float?
    let httpMethod:HTTPMethod
    
    public init(url: String,
                    headers: [String: String]? = nil,
                    reqBody: Encodable? = nil,
                    reqTimeout: Float? = nil,
                    httpMethod: HTTPMethod
        ) {
            self.url = url
            self.headers = headers
            self.body = reqBody?.encode()
            self.requestTimeOut = reqTimeout
            self.httpMethod = httpMethod
        }
        
        public init(url: String,
                    headers: [String: String]? = nil,
                    reqBody: Data? = nil,
                    reqTimeout: Float? = nil,
                    httpMethod: HTTPMethod
        ) {
            self.url = url
            self.headers = headers
            self.body = reqBody
            self.requestTimeOut = reqTimeout
            self.httpMethod = httpMethod
        }
        
        func buildURLRequest(with url: URL) -> URLRequest {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = httpMethod.rawValue
            urlRequest.allHTTPHeaderFields = headers ?? [:]
            urlRequest.httpBody = body
            return urlRequest
        }
    
}

public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
    
    public init?(rawValue: String) {
        switch rawValue.uppercased() {
        case "GET": self = .GET
        case "POST": self = .POST
        case "PUT": self = .PUT
        case "DELETE": self = .DELETE
        default: return nil
        }
    }
}

public enum NetworkError: Error, Equatable {
    case badURL(url: String)
    case apiError(code: Int, error: String)
    case invalidJSON(_ error: String)
    case unauthorized(code: Int, error: String)
    case badRequest(code: Int, error: String)
    case serverError(code: Int, error: String)
    case noResponse(_ error: String)
    case unableToParseData(_ error: String)
    case unknown(code: Int, error: String)
    
    public init(error: NetworkError) {
        switch error {
        case .badURL(url: let url): self = .badURL(url: url)
        case .apiError(code: let code, error: let error):
            self = .apiError(code: code, error: error)
        case .invalidJSON(_):
            self = .invalidJSON("")
        case .unauthorized(code: let code, error: let error):
            self = .unauthorized(code: code, error: error)
        case .badRequest(code: let code, error: let error):
            self = .badRequest(code: code, error: error)
        case .serverError(code: let code, error: let error):
            self = .serverError(code: code, error: error)
        case .noResponse(_):
            self = .noResponse("")
        case .unableToParseData(_):
            self = .unableToParseData("")
        case .unknown(code: let code, error: let error):
            self = .unknown(code: code, error: error)
        }
    }
    
}

public extension Encodable {
    func encode() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            return nil
        }
    }
}
