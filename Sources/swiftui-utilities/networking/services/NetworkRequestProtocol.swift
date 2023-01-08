//
//  Requestable.swift
//  Dimitra
//
//  Created by Nikhil on 06/09/2022.
//

import Foundation
import Combine

// MARK: - Protocol containing a generic function to handle requests
@available(iOS 13.0, *)
public protocol NetworkClientProtocol{
    
    /**
                # Defines request time-out
     */
    var requestTimeOut: Float { get }
    
    
    /**
                ## Generic request function 
     */
    func request<T:Codable>(_ response: T.Type, _ req:NetworkRequest) -> AnyPublisher<T, NetworkError>
}
