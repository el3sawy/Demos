//
//  WeatherInfoView.swift
//  WeatherApp
//
//  Created by Ahmed Elesawy on 31/05/2022.
//

import SwiftUI

struct WeatherInfoView: View {
    let dayName: String
    let imageName: String
    let degree: String
    var body: some View {
        VStack {
            Text(dayName)
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(Color.white)
            
            Text(degree)
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }.frame(maxWidth: .infinity)
    }
}

struct WeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoView(dayName: "Day", imageName: "sun.min", degree: "40")
    }
}
