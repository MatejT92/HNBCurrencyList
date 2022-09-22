//
//  NetworkConnectivity.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 22.09.2022..
//

import Foundation
import Network

class NetworkConnectivity: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkMonitor", target: .main)
    @Published private(set) var connected: Bool = true
    
    func checkConnection() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.connected = path.status == .satisfied
        }
        monitor.start(queue: queue)
    }
    
    func startAndCheck() -> Bool {
        checkConnection()
        return connected
    }
}
