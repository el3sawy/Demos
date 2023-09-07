//
//  Car.swift
//  CombineUnitTest
//
//  Created by Ahmed Elesawy on 22/02/2023.
//

import Foundation
import Combine

class Car{
    @Published var kwhInBattery = 50.0
    let kwhPerKilometer = 0.14
}

struct CarViewModel{
    var car: Car
    lazy var batterySubject: AnyPublisher<String?, Never> = {
        return car.$kwhInBattery.map({ newCharge in
            return "The car now has \(newCharge)kwh in its battery"
            
        }).eraseToAnyPublisher()
    }()
    mutating func drive(kilometers: Double) {
        let kwhNeeded = kilometers * car.kwhPerKilometer
        assert(kwhNeeded <= car.kwhInBattery, "Can't make trip, not enough charge in battery")
        car.kwhInBattery -= kwhNeeded
    }
}
