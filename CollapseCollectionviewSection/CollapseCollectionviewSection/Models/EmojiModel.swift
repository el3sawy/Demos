//
//  EmojiModel.swift
//  CollapseCollectionviewSection
//
//  Created by Ahmed Elesawy on 29/09/2021.
//

import Foundation
class EmojiModel {
    enum Category: String, CaseIterable {
        case smileysAndPeople = "Smileys & People"
        case animalsAndNature = "Animals & Nature"
        case foodAndDrink = "Food & Drink"
        case activity = "Activity"
        case travelAndPlaces = "Travel & Places"
        case objects = "Objects"
        case symbols = "Symbols"
        case flags = "Flags"
    }
    struct EmojiData {
        var values: [String] = []
        var isOpen: Bool
        
    }
    
    static let shared = EmojiModel()
    
    let sections = Category.allCases
    
    var data: [Category: EmojiData] = [
        .smileysAndPeople: EmojiData(values:["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "☺️", "😊", "🤯", "😇", "🙂", "😎", "🤩", "😴", "😬", "🥵"], isOpen: true),
        .animalsAndNature: EmojiData(values:["🐶", "🐱", "🦊", "🐻", "🦁", "🐮", "🐸", "🐵", "🐔", "🐧", "🦉", "🐴", "🦋", "🐙", "🐬", "🐈", "🌲", "🌍"], isOpen: false),
        .foodAndDrink: EmojiData(values: ["🍏", "🍇", "🍓", "🥝", "🍅", "🌽", "🥕", "🥨", "🧀", "🍖", "🦴", "🌮", "🍣", "🥤", "🥃", "🥟", "🍺", "🍪"], isOpen: false),
        .activity: EmojiData(values:["⚽️", "🏉", "🥏", "🏏", "🥅", "🛹", "🛷", "🏋️‍♂️", "🏅", "🎪", "🎬", "🎼", "🎲", "🎳", "🎮", "🎸", "🧩", "🏆"], isOpen: false),
        .travelAndPlaces: EmojiData(values: ["🚗", "🚑", "🚨", "🚠", "🚟", "🚄", "✈️", "🚤", "🚧", "🏠", "⛱", "🌋", "⛩", "🕋", "⛪️", "🌠", "🌇", "🗽"], isOpen:  false),
        .objects: EmojiData(values: ["⌚️", "🖱", "🖲", "💾", "☎️", "📺", "💴", "🔨", "🧰", "🧲", "🎁", "🎊", "✉️", "🗳", "📌", "🔍", "🔐", "💰"], isOpen: false),
        .symbols: EmojiData(values:["❤️", "💔", "☮️", "☯️", "☢️", "🆚", "🉐", "🆘", "❌", "💯", "‼️", "🚸", "⚜️", "♿️", "🔈", "🔔", "♣️", "🚸"], isOpen: false),
        .flags: EmojiData(values: ["🏳️", "🇺🇸", "🇯🇵", "🇩🇪", "🇨🇦", "🇲🇽", "🇧🇷", "🇰🇪", "🇳🇬", "🇮🇳", "🇷🇺", "🇦🇺", "🇫🇷", "🇵🇱", "🇻🇳", "🇱🇹", "🇱🇰", "🇪🇪"], isOpen: true)
    ]
    
     init() {}
    
    //  static func randomEmoji() -> (Category, String) {
    //    let extraEmoji = ["💀", "🤖", "👍", "🤘🏾", "🖐🏼", "👇🏽", "🙏🏾", "👀", "👩🏽‍🦱", "👩🏿", "🧕🏽", "🕵🏻‍♂️", "👨🏼‍💻", "👭", "🧚🏾‍♂️", "💍"]
    //    let randomIndex = Int.random(in: 0..<extraEmoji.count)
    //    return (.smileysAndPeople, extraEmoji[randomIndex])
    //  }
}
