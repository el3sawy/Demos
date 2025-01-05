//
//  HomeView.swift
//  ColorsApp
//
//  Created by Mac on 03/01/2025.
//

import SwiftUI

struct HomeView: View {
//    @AppStorage("colorName") private var colorName: String = ""
    var body: some View {
        VStack {

            Text("change Color to light ")
                .onTapGesture {
//                    colorName = ColorScheme.light.rawValue

                    NusukUI.color.changeColor(colorScheme: .light)

                    resetAppAfterLocalizationChange()
                }

            Text("change Color to dark ")
                .onTapGesture {
//                    colorName = ColorScheme.dark.rawValue
                    NusukUI.color.changeColor(colorScheme: .dark)
                    resetAppAfterLocalizationChange()

//
                }
            Rectangle()
                .fill(NusukUI.color.color.green10)
                .frame(width: 100, height: 100)

            Rectangle()
                .fill(NusukUI.color.color.red10)
                .frame(width: 100, height: 100)
        }
    }

    func resetAppAfterLocalizationChange() {

        // Save the selected language to UserDefaults (optional)
//        UserDefaults.standard.set(["fr"], forKey: "AppleLanguages")
//        UserDefaults.standard.synchronize()

        // Get the current window
        guard var window = UIApplication.shared.windows.first else { return }
        
        print("Tapped")
        // Instantiate the initial view controller from the storyboard
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        guard let initialViewController = storyboard.instantiateInitialViewController() else { return }

        // Set the new root view controller with a smooth transition
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromRight, animations: {
            window.rootViewController = UIHostingController(rootView: HomeView())
//            AppDelegate.shared.reset()
        }, completion: nil)
    }
}

#Preview {
    HomeView()
}
