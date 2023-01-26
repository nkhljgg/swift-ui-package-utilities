//
//  test-service.swift
//  
//
//  Created by Nikhil on 08/01/23.
//

import Foundation
import Combine

/* Instead of TestProtocol, we replace Test with the Service's name.

 Example: ProfileDetailsProtocol
 
 */

protocol TestProtocol {
    func getTestData() -> AnyPublisher<APIPayloadResponse<[TestData]>, NetworkError>
}


public class TestService: TestProtocol {
    
    private let client: APIClientProtocol
    
    init(client: APIClientProtocol) {
        self.client = client
    }
    
    func getTestData() -> AnyPublisher<APIPayloadResponse<[TestData]>, NetworkError> {
        let apiRequest = APIRequest(method: .GET, url: "https://myhostingservice.api/test", body: nil)
        return self.client.performRequest(responseType: APIPayloadResponse<[TestData]>.self, request: apiRequest)
    }
}
