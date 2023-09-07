//
//  Loader.swift
//  SecondAppSwiftUIHandousn
//
//  Created by NTG on 10/08/2023.
//

import SwiftUI

struct Loader: View {
    @State private var isLoading = false
    var body: some View {
            VStack {
                if isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    Text("Content Loaded")
                }

                Button(action: {
                    isLoading.toggle()

                    // Simulate an asynchronous task
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isLoading.toggle()
                    }
                }) {
                    Text("Toggle Loader")
                }
            }
            .padding()
        }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}
