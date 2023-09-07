
import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
    
    var str1 = ""
    var str2 = ""
    preOrder(root: root, result: &str1)
    preOrder(root: subRoot, result: &str2)
    
    return str1.contains(str2)
}

var str = ""
func preOrder(root: TreeNode?, result: inout String) {
    guard let root = root else {
        return
    }

    result += "\(root.val)"
    preOrder(root: root.left, result: &result)
    preOrder(root: root.right, result: &result)
}


func identical(root1: TreeNode?, root2: TreeNode?) -> Bool {
    if root1 == nil && root2 == nil {
        return true
    }

    if root1?.val != root2?.val {
        return false
    }
    
    let r1 = identical(root1: root1?.left, root2: root2?.left)
    let r2 = identical(root1: root1?.right, root2: root2?.right)
    
    if !r1 || !r2 {
        return false
    }
    return true
}


func isSubtree1(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    guard let s = s else { return false }
    if isTheSame(s, t) { return true }
    return isSubtree(s.left, t) || isSubtree(s.right, t)
}

func isTheSame(_ first: TreeNode?, _ second: TreeNode?) -> Bool {
    if first == nil && second == nil { return true }
    if first == nil || second == nil { return false }

    return first!.val == second!.val &&
           isTheSame(first!.left, second!.left) &&
           isTheSame(first!.right, second!.right)
}
let root1 = TreeNode(5)
root1.left = TreeNode(2)
root1.right = TreeNode(9)

let root2 = TreeNode(5)
root2.left = TreeNode(3)
root2.right = TreeNode(9)

identical(root1: root1, root2: root2)



var x: Int = 0 {
    willSet {
        print("will set  ",x)
    }
    didSet {
        print("did set  ",x)
    }
}

x = 2
x = 10
