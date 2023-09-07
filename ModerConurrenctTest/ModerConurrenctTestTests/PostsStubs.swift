//
//  PostsStubs.swift
//  ModerConurrenctTestTests
//
//  Created by Ahmed Elesawy on 03/01/2023.
//

import Foundation
@testable import ModerConurrenctTest

enum PostsStubs {
    static func createListPosts() -> [PostModel] {
        let data = getJSON(bundle: Bundle.testBundle, for: "Posts_Model")
        let foods = parse(jsonData: data)
        return foods
    }
    
    static func getListPostsData() -> Data? {
        let jsonData = try? JSONEncoder().encode(createListPosts())
        return jsonData
    }
    
    private static func parse(jsonData: Data) -> [PostModel] {
        do {
            let decodedData = try JSONDecoder().decode([PostModel].self, from: jsonData)
            return decodedData
        } catch {
            print("decode error")
        }
        return []
    }
}
