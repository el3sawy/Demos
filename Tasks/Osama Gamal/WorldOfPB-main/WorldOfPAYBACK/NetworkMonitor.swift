//
//  NetworkMonitor.swift
//  WorldOfPAYBACK
//
//  Created by Osama Gamal on 08/05/2023.
//

import Combine
import Network

class NetworkMonitor: ObservableObject {
    @Published var isOffline: Bool = false
    private var monitor: NWPathMonitor
    private var cancellable: AnyCancellable?

    init() {
        monitor = NWPathMonitor()
        
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isOffline = path.status == .unsatisfied
            }
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
        
        // Retain the instance of NetworkMonitor while it's monitoring network status
        cancellable = AnyCancellable { [weak self] in
            self?.monitor.cancel()
        }
    }
}
