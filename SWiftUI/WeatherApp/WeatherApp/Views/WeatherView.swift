//
//  ContentView.swift
//  WeatherApp
//
//  Created by Ahmed Elesawy on 30/05/2022.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                CityWeatherView()
                    .padding(.bottom, 20)
                HStack{
                    WeatherInfoView(dayName: "Sat", imageName: "sun.min", degree: "49")
                    WeatherInfoView(dayName: "Sun", imageName: "sun.max", degree: "43")
                    WeatherInfoView(dayName: "Mon", imageName: "sun.haze", degree: "25")
                    WeatherInfoView(dayName: "Thurs", imageName: "cloud.rain.fill", degree: "35")
                    WeatherInfoView(dayName: "Friday", imageName: "cloud.sun.rain", degree: "25")
                }.padding()
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
