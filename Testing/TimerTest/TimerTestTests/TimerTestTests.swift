//
//  TimerTestTests.swift
//  TimerTestTests
//
//  Created by Ahmed Elesawy on 17/01/2022.
//

import XCTest
@testable import TimerTest

class TimerTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_feature_with_old_method() {
        let sut = FeaturePlaceManager()
        XCTAssertEqual(sut.counter, 0)
        
        sut.runTimer()
        
        RunLoop.current.run(until: Date(timeIntervalSinceNow: 6))
        XCTAssertEqual(sut.counter, 1)
        
    }
    
    func test_feature_with_anotherWayButNotGood_method() {
        let sut = FeaturePlaceManager()
        XCTAssertEqual(sut.counter, 0)
        sut.interval = 1
        sut.runTimer()
        
        RunLoop.current.run(until: Date(timeIntervalSinceNow: 2))
        XCTAssertEqual(sut.counter, 1)
        
    }

    /*
     how timer work
     1- create the timer
     2- add the timer to run loop
     */
    
    func test_log_new_approach() {
        let timerScheduler = MockTimer()
//        var timerDelay = TimeInterval(0)
        timerScheduler.handelAddTimer = { timer in
//            timerDelay  = timer.fireDate.timeIntervalSinceNow
            timer.fire()
            
        }
        let sut = Log(timerScheduler: timerScheduler)
        XCTAssertEqual(sut.counter, 0)

        sut.runTimer()
        
        XCTAssertEqual(sut.counter, 1)
        
    }
    
}



class MockTimer: TimerScheduler {
    var handelAddTimer: ((_ timer: Timer) -> Void )?
    
    func add(_ timer: Timer, forMode mode: RunLoop.Mode) {
        handelAddTimer?(timer)
    }
}
