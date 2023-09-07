//
//  Article.swift
//  ModernConcurrency
//
//  Created by NTG on 26/08/2023.
//

import Foundation
//https://swiftsenpai.com/swift/sendable-prevent-data-races/
final class Article {

    let title: String
    var likeCount = 0

    init(title: String) {
        self.title = title
    }
}
 


struct Weather: Sendable {
    let temperature: Double
    let condition: String
}

// Simulate an asynchronous function to fetch weather data from an API
func fetchWeatherData(completion: @escaping  (Weather) -> Void) {
    // Simulate a network request delay
    DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
        // Simulate fetching weather data
        let weather = Weather(temperature: 25.0, condition: "Sunny")
        
        // Call the completion closure when data is available
        completion(weather)
    }
}

// Function to fetch weather data and update the UI
func fetchAndUpdateWeather() {
    print("Fetching weather data...")

    // Use the @sendable closure in the asynchronous function
    fetchWeatherData { weather in
        // Update the UI with the fetched weather data
        updateUI(with: weather)
    }

    print("Request sent, waiting for data...")
}

func  updateUI(with: Weather) {}
// Call the function to fetch and update weather data
//fetchAndUpdateWeather()

// Continue with other tasks while waiting for weather data
//print("Doing other tasks...")
func runLater(_ function: @escaping () -> Void) -> Void {
    DispatchQueue.global().asyncAfter(deadline: .now() + 3, execute: function)
}
