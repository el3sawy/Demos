//
//  ContentView.swift
//  LandmarkApp
//
//  Created by Ahmed Naguib on 11/03/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    @State var lands: [Landmark] = load("landmarkData.json")
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (landmark.isFavorite || showFavoritesOnly)
        }
    }
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Show Favorites Only")
                }
                
                ForEach(0..<filteredLandmarks.count, id: \.self) { index in
                    NavigationLink {
//                        LandMarkDetails(modelData: $lands[index])
                    } label: {
                        LandMarkRow(landmark: filteredLandmarks[index])
                    }
                }
            }
            .animation(.default, value: showFavoritesOnly)
            .background(Color.gray.opacity(0.3))
            .navigationTitle("Landmark List")
        }
    }
}

#Preview {
    ContentView()
}
