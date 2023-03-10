//
//  
//
//  Created by Nikhil on 08/01/23.
//

import Foundation
import Combine
import SwiftUI


public class TestViewModel: ObservableObject {
    
    @Published var testData = [TestData]()
    
    private var cancellables = Set<AnyCancellable>()
    private var service = TestService(client: APIClient(network: NetworkClient()))
    
    public init(testData: [TestData], cancellables: Set<AnyCancellable>, service: TestService) {
        self.testData = testData
        self.cancellables = cancellables
        self.service = service
    }
    
    func fetchData() {
        service.getTestData().receive(on: DispatchQueue.main)
            .sink { error in
                print(error)
                
            } receiveValue: { [weak self] data in
                    
                self?.testData = data.data
                
            }.store(in: &cancellables)
    }
}
