import Foundation

// Use when the array is sorted //O(log n)


func binarySearch(arr: [Int], target: Int) -> Int {
    var start = 0
    var end = arr.count - 1
    
    while(start <= end) {
        let mid = (start + end) / 2
        if arr[mid] == target {
            return mid
        } else if arr[mid] < target {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return -1
}


let arr1 = [1,2,3,6,7,8,10]
let target = 1

//binarySearch(arr: arr, target: target)

// is perfect square
// you can use this  sqrt(16)

func isPerfectSquare(_ num: Int) -> Bool {
    
    var low = 1
    var heigh = num
    while(low <= heigh) {
        let mid = (low + heigh) / 2
        let square = mid * mid
        if square == num {
            return true
        } else if square < num {
            low = mid + 1
        } else {
            heigh = mid - 1
        }
    }
    
    return false
}
//isPerfectSquare(16)

//https://leetcode.com/problems/search-in-rotated-sorted-array/

func search(_ numbers: [Int], _ target: Int) -> Int {
    
    var low = 0
    var high = numbers.count - 1
    while(low <= high) {
        let mid = (low + high) / 2
        if numbers[mid] == target {
            return mid
        } else if numbers[low] <= numbers[mid] {
            if numbers[low] <= target && numbers[mid] > target {
                high = mid - 1
            } else {
                low = mid + 1
            }
        } else {
            if numbers[mid] < target && numbers[high] >= target {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
    }
    
    return -1
}

//search([1,0,1,1,1], 0)
//https:leetcode.com/problems/search-in-rotated-sorted-array-ii/
func searchRotated(_ numbers: [Int], _ target: Int) -> Int {
    
    var low = 0
    var high = numbers.count - 1
    while(low <= high) {
        let mid = (low + high) / 2
        if numbers[mid] == target {
            return mid
        } else if numbers[low] < numbers[mid] {
            if numbers[low] <= target && numbers[mid] >= target {
                high = mid - 1
            } else {
                low = mid + 1
            }
        } else if numbers[low] > numbers[mid] {
            if numbers[mid] <= target && numbers[high] >= target {
                low = mid + 1
            } else {
                high = mid - 1
            }
        } else if numbers[low] == numbers[mid] {
            low += 1
        }
    }
    
    return -1
}
//searchRotated([1,0,1,1,1], 0)

//https://leetcode.com/problems/search-a-2d-matrix/
func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    for item in matrix {
        if binarySearch(arr: item, target: target) != -1 {
            return true
        }
    }
    
    return false
}

searchMatrix([[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], 20)
