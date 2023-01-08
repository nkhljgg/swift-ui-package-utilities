//
//  DimitraAPI.swift
//  Dimitra
//
//  Created by Nikhil on 06/09/2022.
//

import Foundation
import Combine

public typealias Headers = [String: String]

@available(iOS 13.0, *)
public protocol APIClientProtocol{
    init(network:NetworkClientProtocol)
    func performRequest<T:Codable>(responseType: T.Type, request:APIRequest) -> AnyPublisher<T, NetworkError>
}

@available(iOS 13.0, *)
public class APIClient: APIClientProtocol {
    
    var timeout: Int { return 20 }
    var baseUrl: String = ""
    
    private var client:NetworkClientProtocol
    private var token:String
    
    required public init(network:NetworkClientProtocol){
        self.client = network
        self.token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7InVzZXJJZCI6MjQ2fSwiaWF0IjoxNjY1NzI3NjU5fQ.sPJAyvhnTAsLeHrC5O1hnWuIDWYajyUpIGRKNTMeHUw"
        // Todo: Fetch token from UserDefaults
    }
    
    public func performRequest<T : Codable>(responseType: T.Type, request:APIRequest)  -> AnyPublisher<T, NetworkError>{
        var headers: Headers = [:]
        headers["Content-Type"] = "application/json"
        headers["oauth-token"] = "\(token)"
        
        let url = "\(baseUrl)/\(request.endpoint)"
        print("URL \(url)")
        let request = NetworkRequest(url: url, headers: headers, reqBody: request.body, httpMethod: request.method)
        return self.client.request(responseType, request)
    }
    
}
