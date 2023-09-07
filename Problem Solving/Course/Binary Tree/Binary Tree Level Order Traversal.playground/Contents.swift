//https://leetcode.com/problems/binary-tree-level-order-traversal/
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


class Queue<T> {
    private var array: [T] = []
    
    func push(_ item: T) {
        array.append(item)
    }
    
    func pop() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    func peek() -> T? {
        return array.first
    }
}


func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var arrLevels: [Int: [Int]] = [:]
    var arrNodes: [[Int]] = []
    guard let root = root else {
        return arrNodes
    }

    
    let queue = Queue<Levels>()
    queue.push(Levels(node: root, level: 0))
    arrLevels[0] = [root.val]
    
    while queue.count > 0 {
        let currentLevel = queue.pop()!
        let currentNode = currentLevel.node
        let nextLevel = currentLevel.level + 1
        if let left = currentNode.left?.val {
            queue.push(Levels(node: currentNode.left!, level: nextLevel))
            
            if let _ = arrLevels[nextLevel] {
                arrLevels[nextLevel]?.append(left)
            } else {
                arrLevels[nextLevel] = [left]
            }
        }
        
        if let right = currentNode.right?.val {
            queue.push(Levels(node: currentNode.right!, level: nextLevel))
            if let _ = arrLevels[nextLevel] {
                arrLevels[nextLevel]?.append(right)
            } else {
                arrLevels[nextLevel] = [right]
            }
        }
    }
    
     arrNodes  = Array(repeating: [], count: arrLevels.count)
    arrLevels.forEach {
        arrNodes[$0.key] = $0.value
    }
    return arrNodes
}

class Levels {
    let node: TreeNode
    let level: Int
    
    init(node: TreeNode, level: Int ){
        self.node = node
        self.level = level
    }
}
let root = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)

root.right?.left = TreeNode(15)
root.right?.right = TreeNode(7)

//root.left?.left = TreeNode(5)
//root.left?.right = TreeNode(8)
 
let result =  levelOrder(root)

let x = result.map { arr -> Double in
    
    let count: Double = Double(arr.reduce(0, +))
    print(count)
    let div: Double = count / Double(arr.count)
    return div
}



func levelOrder2(_ root: TreeNode?) -> [[Int]] {
    var arrLevels: [[Int]] = []
    
    guard let root = root else {
        return arrLevels
    }
    arrLevels[0] = [root.val]
    
    let queue = Queue<Levels>()
    queue.push(Levels(node: root, level: 0))
    
    while !queue.isEmpty {
        let currentNode = queue.pop()!
        let nextLevel = currentNode.level + 1
        
        
    }
    return arrLevels
}
