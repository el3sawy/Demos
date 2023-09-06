//
//  File.swift
//  TimerTest
//
//  Created by Ahmed Elesawy on 17/01/2022.
//

import Foundation

class FeaturePlaceManager {
    
    var counter = 0
    var interval: TimeInterval = 5
    func runTimer() {
        Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { [weak self] _ in
            self?.increment()
        }
    }
    
    private func increment() {
        counter += 1
        print(counter)
    }
}
