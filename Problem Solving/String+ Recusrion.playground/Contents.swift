import Foundation

//func drawStaircase(size n: Int) -> String {
//    var stairs = String()
//    // iterate over range of 1 and n
//    for step in (1...n) {
//        // repeat \s and # accordingly
//        stairs += String(repeating: " ", count: step - 1) + String(repeating: "#", count: n + 1 - step) + "\n"
//    }
//    return stairs
//}
//
//print(drawStaircase(size: 4))




// Reverse the string charcters
func revserse( str:  String) -> String {
    if str == "" {
        return ""
    } else {
        return revserse(str: "\(str.dropFirstItem)") + str.firstItem
    }
}
print(revserse(str: "Ahmed"))


// Palindrome
func isPalindrome(str: String) -> Bool {
    let count = str.count
    if count == 0 || count == 1 {
        return true
    }
    
    if str.firstItem == str.lastItem {
        return isPalindrome(str: str.subString(from: 1, to: count - 1))
    }
    
    return false
}
print(isPalindrome(str: "aabau"))

// Convert Decimal to binary

func binary(decimal: Int, result: String) -> String {
    if decimal == 0 {
        return result
    }
    
    let value =  String(decimal % 2) + result
    return binary(decimal: decimal / 2, result: value)
}
print(binary(decimal: 233, result: ""))

func summation(value: Int) -> Int {
    if value <= 1 {
        return value
    }
    print(value)
    return summation(value: value - 1) + value
}
print("summation=", summation(value: 10))


extension String {
    func subString(from: Int, to: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: from)
        let endIndex = self.index(self.startIndex, offsetBy: to)
        return String(self[startIndex..<endIndex])
    }
    
    var firstItem: String  {
        if let f = self.first {
            return String(f)
        }
        return ""
    }
    
    var lastItem: String  {
        if let f = self.last {
            return String(f)
        }
        return ""
    }
    
    var dropFirstItem: String  {
        return String(self.dropFirst())
    }
    
    var dropLastItem: String  {
        return String(self.dropLast())
    }
}
