
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

func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else {return 0}
    print( "left =", root.left?.val, "right= ", root.right?.val)
    return 1 + max(maxDepth(root.left), maxDepth(root.right))
}
let root = TreeNode(-8)
root.left = TreeNode(-6)
root.right = TreeNode(7)

root.right?.left = TreeNode(15)
root.right?.right = TreeNode(9)

root.left?.left = TreeNode(5)
root.left?.right = TreeNode(8)

maxDepth(root)
