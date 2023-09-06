//
//  Log.swift
//  TimerTest
//
//  Created by Ahmed Elesawy on 17/01/2022.
//

import Foundation

class Log {
    
    var counter = 0
    private var timerScheduler: TimerScheduler
    
    init(timerScheduler: TimerScheduler) {
        self.timerScheduler = timerScheduler
    }
    func runTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { [weak self] _ in
            self?.increment()
        }
        timerScheduler.add(timer, forMode: .default)
    }
    
    private func increment() {
        counter += 1
        print(counter)
    }
}

protocol TimerScheduler {
    func add(_ timer: Timer, forMode mode: RunLoop.Mode)
}

extension RunLoop: TimerScheduler {}
