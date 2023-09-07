//
//  CityWeatherView.swift
//  WeatherApp
//
//  Created by Ahmed Elesawy on 30/05/2022.
//

import SwiftUI

struct CityWeatherView: View {
    var body: some View {
        VStack {
            Text(" Cairo, Egypt ")
                .foregroundColor(.white)
                .font(.system(.largeTitle))
                .fontWeight(.bold)
            Image(systemName: "cloud.sun.fill")
                .resizable()
                .frame(width: 160, height: 120, alignment: .center)
                .foregroundColor(Color.white)
                
            Text("60")
                .foregroundColor(.white)
                .font(.system(.largeTitle))
                .fontWeight(.bold)
        }
    }
}

struct CityWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CityWeatherView()
    }
}
