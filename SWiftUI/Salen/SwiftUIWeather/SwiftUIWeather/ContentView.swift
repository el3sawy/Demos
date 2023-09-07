//
//  ContentView.swift
//  SwiftUIWeather
//
//  Created by Ahmed Elesawy on 08/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    var body: some View {
        
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityNameView(name: "Cairo Weather")
                WeatherStatusView(imageName:  isNight ? "cloud.moon" :  "cloud.sun.fill", temp: 77)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayName: "SAT", imageName: "cloud.sun.fill", temp: 20)
                    WeatherDayView(dayName: "SUN", imageName: "cloud.heavyrain.fill", temp: 30)
                    WeatherDayView(dayName: "TUS", imageName: "cloud.fill", temp: 55)
                    WeatherDayView(dayName: "SUN", imageName: "cloud.bolt.rain.fill", temp: 33)
                    WeatherDayView(dayName: "FRI", imageName: "cloud.heavyrain.fill", temp: 66)
                }
                .padding(.bottom, 40)
                
                Button {
                    isNight.toggle()
                } label: {
                    Text("Change Weather day")
                        .frame(width: 280, height: 44)
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(.blue)
                        .background(Color.white)
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayName: String
    var imageName: String
    var temp: Int
    var body: some View {
        VStack(spacing: 5) {
            Text(dayName)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding  var isNight: Bool
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue,  isNight ? .gray : .white],
                       startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityNameView: View {
    var name: String
    var body: some View {
        Text(name)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(Color.white)
            .padding()
    }
}

struct WeatherStatusView: View {
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
