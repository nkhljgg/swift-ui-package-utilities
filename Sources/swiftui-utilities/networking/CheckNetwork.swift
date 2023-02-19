//
//  CheckNetwork.swift
//  
//
//  Created by Nikhil on 19/02/23.
//

import Foundation
import Network

/*
 Usage:
 *In your view*
 
 @StateObject var network = Network()
 
 *To check*
 if network.connected
 
 */

public class Network: ObservableObject {
    public let monitor = NWPathMonitor()
    public let queue = DispatchQueue(label: "Monitor")
    @Published private(set) var connected: Bool
    
    public init(connected: Bool = false) {
        self.connected = connected
    }
    
    func checkConnection() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                    self.connected = true
            } else {
                    self.connected = false
            }
        }
        monitor.start(queue: queue)
    }
}
