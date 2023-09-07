//
//  ToDoViewModel.swift
//  PaulHudsonPlay
//
//  Created by NTG on 20/07/2023.
//

import Foundation

struct ToDoModel: Codable, Identifiable {
    var id = UUID()
    var type: String
    var name: String
    var price: Double
}

class ToDoViewModel: ObservableObject {
    
    @Published var items: [ToDoModel] = [] {
        didSet {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(items) {
                UserDefaults.standard.set(data, for: .items)
            }
        }
    }
    
    init() {
       let decoder = JSONDecoder()
        
        if let data = UserDefaults.standard.data(for: .items),
           let values = try? decoder.decode([ToDoModel].self, from: data) {
            items = values
            return
        }
        
        items = []
    }
    
    
}


 enum UserDefaultsKey: String {
    case items
}

extension UserDefaults {
    func set(_ value: Any, for key: UserDefaultsKey) {
        self.set(value, forKey: key.rawValue)
    }
    func bool(for key: UserDefaultsKey) -> Bool {
        return self.bool(forKey: key.rawValue)
    }
    func data(for key: UserDefaultsKey) -> Data? {
        return self.data(forKey: key.rawValue)
    }
}
