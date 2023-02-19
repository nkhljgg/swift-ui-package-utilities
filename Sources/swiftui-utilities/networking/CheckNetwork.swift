//
//  CheckNetwork.swift
//  
//
//  Created by Nikhil on 19/02/23.
//

import Foundation
import Network

public class NetworkMonitor: ObservableObject {
    
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "Monitor")
    public var connected = false

    public init() {
        networkMonitor.pathUpdateHandler = { path in
            self.connected = path.status == .satisfied
            Task {
                await MainActor.run {
                    self.objectWillChange.send()
                }
            }
        }
        networkMonitor.start(queue: workerQueue)
    }
}

/*
 Usage:
 
 *In a single view*
 
 @StateObject var network = NetworkMonitor()
 
 *To check*
 if network.connected
 
 --**OR**--
 
 *Inject in the main app
 
 @main
 struct MyApp: App {
     @StateObject var networkMonitor = NetworkMonitor()

     var body: some Scene {
         WindowGroup {
             ContentView()
                 .environmentObject(networkMonitor)
         }
     }
 }
 
 *And usage*
 
 struct ContentView: View {
     @EnvironmentObject var networkMonitor: NetworkMonitor
     ...
 }
 
 */
