import Foundation


func isPalindrome(_ s: String) -> Bool {
    let ss = s.lowercased().filter({  $0.isLetter || $0.isNumber })
    
    let arr = Array(ss)
    let len = arr.count
    for i in 0..<len / 2 {
        if arr[i] != arr[len - i - 1] {
            return false
        }
    }
    return true
}
isPalindrome("A man, a plan, a canal: Panama")


func isAnagram(_ s: String, _ t: String) -> Bool {
    let f = Array(s).sorted()
    let l = Array(t).sorted()
    return l == f
    }
isAnagram("aacc", "ccac")
