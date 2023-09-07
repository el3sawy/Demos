import Foundation

func solution(input:[String])-> String {
    
    var x = 0
    var o = 0
    var invalid = 0
    
    for i in input {
        let items = getRowItems(str: i)
        let countX = getCountType(arr: items, type: "x")
        let countO = getCountType(arr: items, type: "o")
        
        if checkValidation(x: countX, o: countO) {
            let win = getWin(arr: items)
            if win.count == 1 {
                let winStr = win.first ?? ""
                if winStr == "x" {
                    x += 1
                } else if winStr == "o" {
                    o += 1
                }
                else {
                    invalid += 1
                }
            }else {
                invalid += 1
            }
            
        }else {
            invalid += 1
        }
    
    }
    

      return "x: \(x) o: \(o) invalid: \(invalid)"
//    return "\(x: "\(x)" , o: "\(o)", invalid: "\(invalid)")"
}

func getRowItems(str: String) -> [[String]] {
    let firstStr = str.split(separator: " ").dropFirst().map({String($0)})
    
    let items = firstStr.map({
        return Array($0).map({ String($0)})
    })
    
    return items
}

func getCountType(arr: [[String]], type: String) -> Int {
    var counter = 0
    
    for row in arr {
        for item in row {
            if item == type {
                counter += 1
            }
        }
    }
    return counter
}

func checkValidation(x: Int, o: Int) -> Bool {
    
   let sub = abs(x - o)
    return sub <= 1
}

func getWin(arr: [[String]]) -> [String] {
    
    var result: [String] = []
    for (index, item) in arr.enumerated() {
        
        let columns = arr.map { $0[ index ] }
        if item.allSatisfy({ $0 == "x" }) {
            result.append("x")
        }
        if item.allSatisfy({ $0 == "o" }) {
            result.append("o")
        }
        if columns.allSatisfy( { $0 == "x" })  {
            result.append("x")
        }
        if columns.allSatisfy( { $0 == "o" }) {
            result.append("o")
        }
    }
    
    var leftDio: [String] = []
    var rightDio: [String] = []
    for i in 0..<arr.count {
        leftDio.append(arr[i][i])
        rightDio.append(arr[i][arr.count-i-1])
    }
    
    if leftDio.allSatisfy({ $0 == "o" }) {
        result.append("o")
    }
    if  leftDio.allSatisfy({ $0 == "x" }) {
        result.append("x")
    }
    if rightDio.allSatisfy({ $0 == "o" })  {
        result.append("o")
    }
    if rightDio.allSatisfy({ $0 == "x" }) {
        result.append("x")
    }
    
    
    return result
}

// let items = getRowItems(str: "4x4 xoxo xoxo x--- xo--")
//let countX = getCountType(arr: items, type: "x")
//let countO = getCountType(arr: items, type: "o")
//
//checkValidation(x: countX, o: countO)
//
//
//getWin(arr: items)
//
//

let arr = [
        "3x3 xxo oo- oxx",
        "2x2 xo x-",
        "4x4 xoxo xoxo x--- xo--",
        "3x3 xxo ooo oox",
    "3x3 xxx ooo ---"
]
solution(input: arr)
