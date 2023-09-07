import Foundation
/*
 Video 1
 https://www.youtube.com/watch?v=hYalOGs1_Og&list=PLYknlDiw2kSwdDhTSDoX7ZoVEle8nbZdk&index=2
 */

func divideArrayIntoTwoParts(arr: [Int]) -> Int {
    
    var left = arr[0]
    var right = arr.reduce(0, +) - left
    var minValue = abs(left  - right)
    for i in 1...arr.count - 1 {
        
        left += arr[i]
        right -= arr[i]
        minValue = min(minValue, abs(left  - right))
    }
    return minValue
}
//divideArrayIntoTwoParts(arr: [2,5,3,1,2,4])


//1- Vanya and Fence
var width = 0
func vanya(fenceHeight: Int, peopleHeight: [Int]) -> Int {
    for i in 0...peopleHeight.count - 1 {
        if peopleHeight[i] > fenceHeight {
            width += 2
        } else {
            width += 1
        }
    }
    return width
}
//vanya(fenceHeight: 1, peopleHeight: [1,1,1,1,1,1])


// 2- Anton and Danik
func anton(str: String) -> String {
    let arr = Array(str)
    let countAntone = arr.filter({$0 == "A"}).count
    let danik = arr.count  - countAntone
    
    if danik > countAntone {
        return "Danik"
    } else if danik == countAntone {
        return "Friendship"
    }
    return "Anton"
}
//anton(str: "DADADA")


// 4- Beautiful Matrix

func beautifulMatrix(matrix: [[Int]]) -> Int {
    var row = 0
    var column = 0
    for arr in matrix.enumerated() {
        if let index = arr.element.firstIndex(of: 1) {
            row = arr.offset
            column = index
        }
    }
    var count = abs( row  - 2)
    count += abs(column - 2)
    return count
}

let arr = [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 1],
    [0, 1, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
]
//beautifulMatrix(matrix: arr)

//5- A word ********
func word(str: String) -> Int {
    let arr = Array(str)
    let uppercaseLetters = CharacterSet.uppercaseLetters
    var countUpperCase = 0
    for i in 0...arr.count - 1 {
        if String(arr[i]).rangeOfCharacter(from: uppercaseLetters) != nil {
            countUpperCase += 1
        }
    }
    return countUpperCase
}
word(str: "AHmed")
