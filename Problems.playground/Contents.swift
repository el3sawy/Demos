//
//  TestDemo.swift
//  AndelaInterview
//
//  Created by Ahmed Elesawy on 27/11/2022.
//

import Foundation
//
//protocol classa {
//   var no1: Int { get set }
//   func calc(sum: Int)
//}
//
//protocol result {
//   func print(target: classa)
//}
//
//class student2: result {
//   func print(target: classa) {
//      target.calc(sum: 1)
//   }
//}
//class classb: result {
//   func print(target: classa) {
//      target.calc(sum: 5)
//   }
//}
//
//class student: classa {
//   var no1: Int = 10
//
//   func calc(sum: Int) {
//      no1 -= sum
//      print("Student attempted \(sum) times to pass")
//
//      if no1 <= 0 {
//         print("Student is absent for exam")
//      }
//   }
//}
//
//class Player {
//   var stmark: result!
//
//   init(stmark: result) { // sum = 1
//      self.stmark = stmark
//   }
//   func print(target: classa) { // no1 =10
//      stmark.print(target: target)
//   }
//}
//
//var marks = Player(stmark: student2())
//var marksec = student()
//
//marks.print(target: marksec) // 9
//marks.print(target: marksec) // 8
//marks.print(target: marksec) // 7
//marks.stmark = classb()
//marks.print(target: marksec) //2
//marks.print(target: marksec) //print("Student is absent for exam")
//marks.print(target: marksec) //print("Student is absent for exam")
//
//
////When we run the above program using playground, we get the following result
//


//What is circular dependencies ?
//What is difference between layout margins and directional layout margins ?
//What is content offset?
//optional binding and optional chaining in swiftzeros(value: "100000000")

//zeros(value: "0000101011011000000")




//if Date() < dateFormatter.date(from: expiryDate) ?? Date() {
//    print("Not Yet expiryDate")
//} else {
//    print("expiryDate has passed")
//}
//
//let nextDate = Date().add(days: 11) ?? Date()
//print(nextDate)


//extension Date {
//    func add(days: Int = 0) -> Date? {
//
//        let components = DateComponents(day: days)
//        return Calendar.current.date(byAdding: components, to: self)
//    }
//}
//
//struct BadgeViewModel {
//    let id: String
//    let status: String
//    var dueDate: String
//    var paymentMethods: [String]
//
//    var billDate: String {
//        return (dueDate + " 10")
//    }
//}
//
//var x = [
//    BadgeViewModel(id: "1", status: "2", dueDate: "Ahmed", paymentMethods: [])
//]
//
//x[0].dueDate = "Naguib"
//
//print(x[0].billDate)
//
//
//let dateString = "2023-07-05T00:00:00+03:00"
//let dateFormatter = DateFormatter()
//
//dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//print("====")
//if let date = dateFormatter.date(from: dateString) {
//    let dateFormatter2 = DateFormatter()
//    dateFormatter2.dateFormat = "yyyy-MM-dd"
//    dateFormatter2.locale = Locale(identifier: "en")
//    let formattedDateString = dateFormatter2.string(from: date)
//    print(formattedDateString) // Output: 05 يوليو 2023
//}

//let date1 = "2023-04-05T00:00:00+03:00".toDate()
//
//    let dateFormatter2 = DateFormatter()
//    dateFormatter2.dateFormat = "dd MMMM yyyy"
//    dateFormatter2.locale = Locale(identifier: "en")
//    let formattedDateString = dateFormatter2.string(from: date1)
//    print(formattedDateString) // Output: 05 July 2023
//
//
//extension String {
//    func toDate(format: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> Date {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = format
//        dateFormatter.locale = Locale(identifier: "en")
//        return dateFormatter.date(from: self) ?? Date()
//    }
//}



//class Condition {
//
//    var array1 = [Int]()
//    func startThread() {
//
//        DispatchQueue.concurrentPerform(iterations: 100) {  (value) in
//            let lastValue = self.array1.last ?? 0
//            Task.detached {
//
//                self.array1.append(lastValue + 1)
//            }
//        }
//    }
//
//    func checkCondition() {
//
//        startThread()
//
//    }
//}
//
//Condition().checkCondition()
//
//
//let data: [Any] = ["leaf", 4.7, 56, "lamp", 2.93, "apple"]
//

//func findCommonPatterns(in arrayOfStrings: [String]) -> [String] {
//    // Count the occurrences of each element in the array
//    let occurrences = arrayOfStrings.reduce(into: [:]) { counts, element in
//        counts[element, default: 0] += 1
//    }
//
//    // Find the maximum occurrence count
//    guard let maxOccurrences = occurrences.values.max() else {
//        return [] // Empty array if the input array is empty
//    }
//
//    // Filter out the elements with the maximum occurrence count
//    let commonPatterns = occurrences.filter { $0.value == maxOccurrences }
//
//    // Get the common patterns as an array
//    let commonPatternsArray = Array(commonPatterns.keys)
//
//    return commonPatternsArray
//}
//
//let x = findCommonPatterns(in: ["leaf", "lamp",  "apple"])
//print(x)


/*
 1- Heap [Ref]
 2- Stack [Value] ->
 */


//enum MyCustomError: LocalizedError, Error {
//    case dataNotFound
//    case invalidData
//
//
//    var errorDescription: String? {
//        switch self {
//        case .dataNotFound:
//            return NSLocalizedString("Data not found.", comment: "MyCustomError: dataNotFound")
//        case .invalidData:
//            return NSLocalizedString("Invalid data.", comment: "MyCustomError: invalidData")
//        }
//    }
//}

public enum NetworkError: LocalizedError, Equatable, Error {
    case badURL(_ error: String)
    case apiError(code: Int, error: String)
    case invalidJSON(_ error: String)
    case unauthorized(code: Int, error: String)
    case badRequest(code: Int, error: String)
    case serverError(code: Int, error: String)
    case noResponse(_ error: String)
    case unableToParseData(_ error: String)
    case unknown(code: Int, error: String)
    case networkNotReachable(_ error: String)
    
    public var localizedDescription: String {
        switch self {
        case .badURL(let error):
            return NSLocalizedString("Bad URL Error: \(error)", comment: "Bad URL Error")
        case .apiError(let code, let error):
            return NSLocalizedString("API Error (Code \(code)): \(error)", comment: "API Error")
        case .invalidJSON(let error):
            return NSLocalizedString("Invalid JSON Error: \(error)", comment: "Invalid JSON Error")
        case .unauthorized(let code, let error):
            return NSLocalizedString("Unauthorized Error (Code \(code)): \(error)", comment: "Unauthorized Error")
        case .badRequest(let code, let error):
            return NSLocalizedString("\(error)", comment: "")
        case .serverError(let code, let error):
            return NSLocalizedString("Server Error (Code \(code)): \(error)", comment: "Server Error")
        case .noResponse(let error):
            return NSLocalizedString("No Response Error: \(error)", comment: "No Response Error")
        case .unableToParseData(let error):
            return NSLocalizedString("Unable to Parse Data Error: \(error)", comment: "Unable to Parse Data Error")
        case .unknown(let code, let error):
            return NSLocalizedString("Unknown Error (Code \(code)): \(error)", comment: "Unknown Error")
        case .networkNotReachable(let error):
            return NSLocalizedString("Network Not Reachable Error: \(error)", comment: "Network Not Reachable Error")
        }
    }
}

// Example usage:
//let error = NetworkError.apiError(code: 404, error: "Resource not found")
//print(error.localizedDescription) // This will print the custom error description for the API error


class Student {
    
    lazy var name = getName()
    
    init() {
        print("Init is called")
    }
    
    func getName() -> String {
        
        
        return "Ahmed"
    }
    
    func demo() {
        lazy var _name = getName()
        _name = "KOKO"
        print(name)
        _name = "Test"
        print(name)
    }
}


//let std1 = Student()
//print(std1.demo())

class Dog {
    let name: String
    init(name: String) {
        self.name = name
    }
    
    @_disfavoredOverload
    func eat() {
        print("Dog \(name) is eating KFC ")
    }
    
    
}


@propertyWrapper
struct CleanedString: Codable {
    private var value: String

    var wrappedValue: String {
        get { return value }
        set { value = newValue.replacingOccurrences(of: "\\n", with: "\n") }
    }

    init(wrappedValue: String) {
        self.value = wrappedValue
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue = try container.decode(String.self)
        self.init(wrappedValue: stringValue)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}






let json1 = "{\"hacker\":\"rank\",\"input\":\"output\"}"
let json2 = "{\"hacker\":\"ranked\",\"input\":\"wrong\"}"

let dic1 = json1.toDic ?? [:]
let dic2 = json2.toDic ?? [:]

var digDic = dic1.count > dic2.count ? dic1 : dic2
var small = dic1.count < dic2.count ? dic1 : dic2
if dic1.count == dic2.count {
    digDic = dic1
    small = dic2
}
var diff: [String] = []

for (key, value) in digDic {
    if let value2 = small[key] {
        if value2 != value {
            diff.append(key)
        }
    } else {
        diff.append(key)
    }
}


let bigString = json1.count > json2.count ? json1 : json2

let specialCharacterSet = CharacterSet(charactersIn: "{\":},")
var cleanedString = bigString.components(separatedBy: specialCharacterSet).filter({ !$0.isEmpty})
//cleanedString = cleanedString.replacingOccurrences(of: ":", with: ",")

print(cleanedString, "  specialCharacterSet")
let arrWithSpecail = Array(bigString.split(separator: ","))


//print(arr, "arr")
var sort: [String] = Array(repeating: "", count: cleanedString.count)



for i in diff {
    print(i)
    if let index = cleanedString.firstIndex(of: i) {
       
        sort[index] = i
      
    } else {
       
    }
}
print(sort.filter({ !$0.isEmpty }))



extension String {
    var toDic: [String: String]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: String]
            } catch {
                print("Error parsing JSON: \(error.localizedDescription)")
            }
        }
        return nil
    }
}
