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

class Network: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    @Published private(set) var connected: Bool = false
    
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
