
import Foundation
// With binary search tree
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
    
    var isLeaf: Bool {
        left != nil || right != nil
    }
}

func lowestCommonAncestorBinarysearch(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    let firstKey = q?.val ?? 0
    let secondKey = p?.val ?? 0
    let rootKey = root?.val ?? 0
    
    guard let root = root else {
        return nil
    }
    print(root.val)
    // right
    if firstKey > rootKey && secondKey > rootKey {
        return lowestCommonAncestorBinarysearch(root.right, p, q)
    } else if firstKey < rootKey && secondKey < rootKey { // left
        return lowestCommonAncestorBinarysearch(root.left, p, q)
    } else {
        return root
    }
}

let root = TreeNode(20)
root.left = TreeNode(8)
root.right = TreeNode(22)

//root.right?.left = TreeNode(0)
//root.right?.right = TreeNode(8)

root.left?.left = TreeNode(4)
root.left?.right = TreeNode(12)
root.left?.right?.left = TreeNode(10)
root.left?.right?.right = TreeNode(14)

//lowestCommonAncestorBinarysearch(root, TreeNode(8), TreeNode(14))?.val

///------------
//https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    if root.val == p?.val || root.val == q?.val { return root }

   
    let left = lowestCommonAncestor(root.left, p, q)
    let right = lowestCommonAncestor(root.right, p, q)
    print("Left = \(root.left?.val)", "right = \(root.right?.val)")
    if left != nil, right != nil { return root }
   
    if left != nil { return left}
    if right != nil { return right }
    return nil
}

lowestCommonAncestor(root, TreeNode(10), TreeNode(14))?.val
