//
//  NetworkObservers.swift
//  RadyaLabs Recruitment
//
//  Created by Jonathan Andrei on 09/09/22.
//

import Foundation
import Network

class NetworkObservers: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Network Monitor")
    @Published private(set) var connected: Bool = false
    
    func checkConnection() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                DispatchQueue.main.async {
                    self.connected = true
                }
            } else {
                DispatchQueue.main.async {
                    self.connected = false
                }
            }
        }
        monitor.start(queue: queue)
    }
}
