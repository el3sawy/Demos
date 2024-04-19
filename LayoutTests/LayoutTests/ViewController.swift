//
//  ViewController.swift
//  LayoutTests
//
//  Created by Ahmed Elesawy on 09/10/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        fetchData()
    }
    
    


}


public protocol BaseMainResponse: Codable {
    var additionalInfo: [BaseMainResponseAdditionalInfo]? { get set }
    var responseCode: String? { get set }
    var responseMsg: String? { get set }
    var errorCode: String? { get set }
    var errorMsg: String? { get set }
    var errorTitle: String? { get set }
    var extTransactionId: String? { get set }
    mutating func decodeKeys(from decoder: Decoder) throws
}

//extension BaseMainResponse where Self: Decodable {
//    init(from decoder: Decoder) throws {
//        try self.init(from: decoder)
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        additionalInfo = try values.decodeIfPresent([BaseMainResponseAdditionalInfo].self, forKey: .additionalInfo)
//        responseCode = try values.decodeIfPresent(String.self, forKey: .responseCode)
//        responseMsg = try values.decodeIfPresent(String.self, forKey: .responseMsg)
//        errorCode = try values.decodeIfPresent(String.self, forKey: .errorCode)
//        errorMsg = try values.decodeIfPresent(String.self, forKey: .errorMsg)
//        errorTitle = try values.decodeIfPresent(String.self, forKey: .errorTitle)
//        extTransactionId = try values.decodeIfPresent(String.self, forKey: .extTransactionId)
//    }
//}

public extension BaseMainResponse {
    var additionalInfo: [BaseMainResponseAdditionalInfo]?  {
        get { return nil }
        set { additionalInfo = newValue  }
    }
    
    var responseCode: String? {
        get { return nil }
        set { responseCode = newValue  }
    }
    
    var responseMsg: String? {
        get { return nil }
        set { responseMsg = newValue  }
    }
    
    var errorCode: String? {
        get { return nil }
        set { errorCode = newValue  }
    }
    
    var errorMsg: String? {
        get { return nil }
        set { errorMsg = newValue  }
    }
    
    var errorTitle: String? {
        get { return nil }
        set { errorTitle = newValue  }
    }
    
    var extTransactionId: String? {
        get { return nil }
        set { extTransactionId = newValue  }
    }
    
    mutating func decodeKeys(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            additionalInfo = try values.decodeIfPresent([BaseMainResponseAdditionalInfo].self, forKey: .additionalInfo)
            responseCode = try values.decodeIfPresent(String.self, forKey: .responseCode)
            responseMsg = try values.decodeIfPresent(String.self, forKey: .responseMsg)
            errorCode = try values.decodeIfPresent(String.self, forKey: .errorCode)
            errorMsg = try values.decodeIfPresent(String.self, forKey: .errorMsg)
            errorTitle = try values.decodeIfPresent(String.self, forKey: .errorTitle)
            extTransactionId = try values.decodeIfPresent(String.self, forKey: .extTransactionId)
        }
    
}


public struct SmilesEmailVerificationResponseModel: BaseMainResponse {
        
    public let status: Int?
    public let successMessage: String?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case successMessage = "successMessage"
    }
    
    public  init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            successMessage = try values.decodeIfPresent(String.self, forKey: .successMessage)
       
        }
    
}

public enum CodingKeys: String, CodingKey {
    case additionalInfo = "additionalInfo"
    case responseCode = "responseCode"
    case responseMsg = "responseMsg"
    case errorCode = "errorCode"
    case errorMsg = "errorMsg"
    case errorTitle = "errorTitle"
    case extTransactionId
}




import Foundation

func fetchData() {
    guard let url = URL(string: "https://dummyjson.com/todos") else {
        print("Invalid URL")
        return
    }

    let request = URLRequest(url: url)

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        // Handle errors
        if let error = error {
            print("Error: \(error.localizedDescription)")
            return
        }

        // Ensure a valid HTTP response
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            print("Invalid response")
            return
        }

        // Ensure there is data
        guard let data = data else {
            print("No data received")
            return
        }

        // Parse the data (assuming JSON response)
        do {
            let decodedData = try JSONDecoder().decode(Welcome.self, from: data)
            // Process the decoded data
            print("Received data: \(decodedData)")
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
        }
    }

    task.resume()
}

// Define a struct to match your expected response format


protocol Demo: Codable {
    var todos: [Todo]? { get set }

}




private struct TemporaryStruct: Decodable {
    var todos: [Todo]?

    enum CodingKeys1: String, CodingKey {
        case todo
    }

    static func decode(from decoder: Decoder) throws -> TemporaryStruct {
        let values = try decoder.container(keyedBy: CodingKeys1.self)
        let todos = try values.decodeIfPresent([Todo].self, forKey: .todo)
        return TemporaryStruct(todos: todos)
    }
}

//extension Demo where Self: Decodable {
//    init(from decoder: Decoder) throws {
//        let temporaryStruct = try TemporaryStruct.decode(from: decoder)
//        self = try Self.create(from: temporaryStruct)
//    }
//
////   fileprivate static func create(from temporaryStruct: TemporaryStruct) throws -> Self {
////        // Initialize and return the conforming type here
////        // You need to implement this method in each conforming type
//////        fatalError("create(from:) method not implemented in the conforming type.")
////    }
//}

public enum CodingKeys1: String, CodingKey {
    case Todo = "Todo"
}
extension Demo {
    var todos: [Todo]?  {
        get { return [] }
        set { todos = newValue }
    }
    
//    var total: Int? {
//        return 0
//    }
}

struct Welcome: Demo {
    
    var todos: [Todo]?
    
//    var todos: [Todo] = []
//    var total: Int?
//    var skip, limit: Int?
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.todos = try container.decode([Todo].self, forKey: .todos)
//        self.total = try container.decodeIfPresent(Int.self, forKey: .total)
//        self.skip = try container.decodeIfPresent(Int.self, forKey: .skip)
//        self.limit = try container.decodeIfPresent(Int.self, forKey: .limit)
//
////        try decodeKeys(from: decoder)
//
//    }
}

// MARK: - Todo
struct Todo: Demo {
    let id: Int
    let todo: String
    let completed: Bool
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case id, todo, completed
        case userID = "userId"
    }
}


@objc public class BaseMainResponseAdditionalInfo : NSObject, Codable {
    
    @objc public var name : String?
    @objc public var value : String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        value = try values.decodeIfPresent(String.self, forKey: .value)
    }
    
    public override init() {}

}

