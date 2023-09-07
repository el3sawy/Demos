var numbers = [2,11,15,7], target = 9

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int]()
        for (i, n) in nums.enumerated() {
            
            if let last = dict[target - n] {
                print("===>", last)
                return [last, i]
            }
            dict[n] = i
            
            print(dict)
        }
        return []
    }


twoSum(numbers, target)
