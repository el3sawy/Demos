//
//  ColorManager.swift
//  ColorsApp
//
//  Created by Mac on 03/01/2025.
//

import SwiftUI
import Combine

protocol NusukColor: Sendable {
    var red10: Color { get }
    var green10: Color { get }
}

struct DarkColor: NusukColor {
    var red10: Color { Color.red }
    var green10: Color { Color.green }
}


struct LightColor: NusukColor {
    var red10: Color { Color.blue }
    var green10: Color { Color.yellow }
}



struct NusukColorManager: Sendable {
    var color: NusukColor = LightColor()
    @AppStorage("colorName") private var colorName: String = ""

    init() {
        updateColor()
    }

    mutating func updateColor() {
        let type = ColorScheme(rawValue: colorName) ?? .dark
        switch type {
        case .dark:
            color = DarkColor()
        case .light:
            color = LightColor()
        }
    }

    mutating func changeColor(colorScheme: ColorScheme) {
        colorName = colorScheme.rawValue
        updateColor()
    }
}


 struct NusukUI: Sendable {
//    private init() {}
    public static var color = NusukColorManager()
}

enum ColorScheme: String, CaseIterable {
    case dark = "dark"
    case light = "light"
}
