var numbers = [1,2,11,15,7], target = 9

//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        var dict = [Int:Int]()
//        for (i, n) in nums.enumerated() {
//
//            if let last = dict[target - n] {
//                print("===>", last)
//                return [last, i]
//            }
//            dict[n] = i
//
//            print(dict)
//        }
//        return []
//    }
//
//


func twoSum(_ arr: [Int], _ target: Int) -> [Int] {
    var dict: [Int: Int] = [:]
    for (index, value) in arr.enumerated() {
        if let last = dict[target - value] {
            return [last, index]
        }
        dict[value] = index
    }
    
    return []
}
twoSum(numbers, target)




// Silide 
let arr = [1,2,3,4,5,6,-3]
let result = 11
var arr2: [Int] = []

arr2.reversed()

let windo = arr.prefix(4)
var sum = windo.reduce(0, +)
arr2.append(sum)
var l = 0
var r = 4

while(r < arr.count) {
    
    sum = sum - arr[l] + arr[r]
    arr2.append(sum)
    r += 1
    l += 1
}


print(arr2)
