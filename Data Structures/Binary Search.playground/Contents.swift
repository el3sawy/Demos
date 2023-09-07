
// Inputs
let array = [1,2,3,4,5,6,7,8,9,10]
let searchValue = 9

// Big (0) = O(log n) 

func binarySearch(sortedArray: [Int], value: Int) -> Int? {
    var low = 0
    var heigh = sortedArray.count - 1
    
    while low <= heigh {
        let mid = (low + heigh) / 2
        let guess = sortedArray[mid]
        
        if guess == value {
            return mid
        } else if guess > value {
            heigh = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return nil
}
binarySearch(sortedArray: array, value: searchValue)


func binaryRec(arr: [Int], value: Int, left: Int, right: Int) -> Int{
    if left > right {
        return -1
    }
    let mid = (left + right) / 2
    
    if arr[mid] == value {
        return mid
    }
    
    if arr[mid] < value {
       return binaryRec(arr: arr, value: value, left: mid + 1, right: right)
    }
    return binaryRec(arr: arr, value: value, left: left, right: mid - 1)
    
}

binaryRec(arr: array, value: searchValue, left: 0, right: array.count)

// Power Sum
let x = 10
let n = 2
var count = 0
func powerSum(i: Int, sum: Int) -> Int {
//    print("(",i,",",sum,")")
    if i == (10) {
//        print(" ==>(",i,",",sum,")")
        if sum == x {
//            print("===============>(",i,",",sum,")")
            count += 1
//            print("powerSum= ", count)
            return count
        }
        return count
    }
    
    if (sum + i.pow(toPower: n)) <= x {
       powerSum(i: i + 1, sum: sum + i.pow(toPower: n))
    }
    powerSum(i: i + 1, sum: sum )
    return count
}
powerSum(i: 1, sum: 0)

extension Int {
    func pow(toPower: Int) -> Int {
        guard toPower >= 0 else { return 0 }
        return Array(repeating: self, count: toPower).reduce(1, *)
    }
}

func checkPowersOfThree(_ n: Int) -> Bool {
        var remainder = n
        while remainder > 0 {
            if remainder % 3 == 2 {
                return false
            }
            remainder /= 3
        }
        return true
    }

checkPowersOfThree(10)


45 % 3
