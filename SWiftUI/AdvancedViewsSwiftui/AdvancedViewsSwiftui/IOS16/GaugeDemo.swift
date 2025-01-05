//
//  GaugeDemo.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 09/08/2024.
//

import SwiftUI
//https://www.youtube.com/watch?v=k38t-tjCM7g

struct GaugeDemo: View {
    @State var value = 20.0

    let min = 0.0
    let max = 100.0
    var body: some View {
        VStack {
            Text("sss")
                .onTapGesture {
                    withAnimation {
                        value += 10
                    }
                    if value == 100 {
                        value = 0
                    }

                }
            Gauge(value: value, in: min...max, label: {
                Text("Label")
            })
            .padding(.bottom, 50)

            Gauge(value: value, in: min...max, label: {
                Text("Label")
            }).gaugeStyle(.accessoryCircularCapacity)
                .scaleEffect(1.5)
        }.padding()
    }
}

#Preview {
    GaugeDemo()
}
