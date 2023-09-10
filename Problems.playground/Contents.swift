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



class Condition {

    var array1 = [Int]()
    func startThread() {

        DispatchQueue.concurrentPerform(iterations: 100) {  (value) in
            let lastValue = self.array1.last ?? 0
            Task.detached {
                
                self.array1.append(lastValue + 1)
            }
        }
    }

    func checkCondition() {

        startThread()

    }
}

Condition().checkCondition()
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
