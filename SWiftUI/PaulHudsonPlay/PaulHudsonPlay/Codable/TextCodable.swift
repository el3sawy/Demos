//
//  TextCodable.swift
//  PaulHudsonPlay
//
//  Created by NTG on 20/07/2023.
//

import SwiftUI

struct TextCodable: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                test2()
            }
    }
    
    
    func test2() {
        let models: MyData = Bundle.main.decode("Demo")
        print(models.customDate)
    }
    
    func test() {
        guard let fileURL = Bundle.main.url(forResource: "Demo", withExtension: "json") else {
          fatalError("person.json not found")
        }

        let jsonData = try! Data(contentsOf: fileURL)
        
        let decoder = JSONDecoder()
        let person = try? decoder.decode(MyData.self, from: jsonData)
        
        print(person)

    }
}

struct TextCodable_Previews: PreviewProvider {
    static var previews: some View {
        TextCodable()
    }
}

enum DataItem: Decodable {
    case video(name: String, baseUrl: String)
    case image(name: String, image: String)
    case live(name: String, liveUrl: String)
    
    private enum CodingKeys: String, CodingKey {
        case name
        case type
        case baseUrl = "base_url"
        case image
        case liveUrl = "live_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let type = try container.decode(String.self, forKey: .type)
        
        switch type {
        case "VIDEO":
            let baseUrl = try container.decode(String.self, forKey: .baseUrl)
            self = .video(name: name, baseUrl: baseUrl)
        case "IMAGE":
            let image = try container.decode(String.self, forKey: .image)
            self = .image(name: name, image: image)
        case "LIVE":
            let liveUrl = try container.decode(String.self, forKey: .liveUrl)
            self = .live(name: name, liveUrl: liveUrl)
        default:
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Invalid data type")
        }
    }
}

struct MyData: Decodable {
    let name: String
    var dob: Date?
    let data: [DataItem]
    
    var customDate: String? {
        return dob?.formatted(date: .abbreviated, time: .omitted)
    }
}




