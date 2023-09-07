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


func isValidBST(_ root: TreeNode?) -> Bool {
    checkForValidBST(node: root, min: nil, max: nil)
}

func checkForValidBST(node: TreeNode?, min: Int?, max: Int?) -> Bool {
//    print("Comparing: ", node?.val, "Min ", min, "Max ", max)
    guard let node = node else {
        return true
    }
    
    if let min = min, node.val <= min {
        print("Error in left Node ", node.val )
        return false
    }
    
    if let max = max, node.val >= max {
        print("Error in right Node ", node.val )
        return false
    }
    return checkForValidBST(node: node.left, min: min, max: node.val) && checkForValidBST(node: node.right, min: node.val, max: max)
}

let root = TreeNode(4)
root.left = TreeNode(2)
root.right = TreeNode(6)

root.left?.left = TreeNode(1)
root.left?.right = TreeNode(3)

root.right?.left = TreeNode(5)
root.right?.right = TreeNode(7)
isValidBST(root)
