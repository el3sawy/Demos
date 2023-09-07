
import Foundation
// Our target is [2,0,3,4,0,2,4] => [2,3,4,2,4,0,0]

var arr = [0,2,0,3,4,0,2,22,0,4]

func solution2() {
    var slow = 0
    
    for faster in 0...arr.count - 1 {
        
        if arr[faster] != 0 {
            let temp = arr[slow]
            arr[slow]  = arr[faster]
            arr[faster ] = temp
            print(slow, "===", faster)
            slow += 1
        } else {
            
        }
        
    }
}


//solution2()
//print(arr)

func solution1() -> [Int] {
    var arr1: [Int] = []
    var counter = 0
    arr.forEach { value in
        if value != 0 {
            arr1.append(value)
        } else {
            counter += 1
        }
    }
    
    arr1.append(contentsOf: Array(repeating: 0, count: counter))
    return arr1
}

solution1()



