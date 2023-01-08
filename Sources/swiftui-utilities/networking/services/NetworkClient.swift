//
//  NativeClient.swift
//  Dimitra
//
//  Created by Nikhil on 06/09/2022.
//

import Foundation
import Combine

@available(iOS 13.0, *)
public class NetworkClient : NetworkClientProtocol{
    
    public init(requestTimeOut: Float = 30) {
        self.requestTimeOut = requestTimeOut
    }
    
    public var requestTimeOut: Float = 30
    
    public func request<T>(_ response: T.Type, _ req: NetworkRequest) -> AnyPublisher<T, NetworkError>
         where T: Decodable, T: Encodable {
            let sessionConfig = URLSessionConfiguration.default
            sessionConfig.timeoutIntervalForRequest = TimeInterval(req.requestTimeOut ?? requestTimeOut)
            
            guard let url = URL(string: req.url) else {
                // Return a fail publisher if the url is invalid
                return AnyPublisher(
                    Fail<T, NetworkError>(error: NetworkError.badURL("\(req.url)"))
                )
            }
            // We use the dataTaskPublisher from the URLSession which gives us a publisher to play around with.
            return URLSession.shared
                .dataTaskPublisher(for: req.buildURLRequest(with: url))
                .tryMap { output in
                         // throw an error if response is nil
                    guard output.response is HTTPURLResponse else {
                        throw NetworkError.serverError(code: 0, error: "Server error")
                    }
                    return output.data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .mapError { error in
                           // return error if json decoding fails
                    NetworkError.invalidJSON(String(describing: error))
                }
                .eraseToAnyPublisher()
        }
}
