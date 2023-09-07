//
//  TaskDemo.swift
//  PaulHudsonPlay
//
//  Created by NTG on 24/07/2023.
//

import Foundation


func fetch() async {
    let fetchTask = Task { () -> String in
        let url = URL(string: "")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let value = try JSONDecoder().decode(Double.self, from: data)
        return "Values are \(value)"
    }
    
//    fetchTask.cancel()
    
    let result = await fetchTask.result
    
    switch result {
    case .success(let success):
        print(success)
    case .failure(let failure):
        print(failure)
    }
}
