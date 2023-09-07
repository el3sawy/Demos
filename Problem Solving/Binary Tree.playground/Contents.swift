// Binary tree
// BST is binary tree but the left less than right
// BST is O(log n) base 2
//https://www.journaldev.com/21454/swift-binary-search-tree
import Foundation

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int, left: Node? = nil, right: Node? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
    var isLeaf: Bool {
        (left == nil && right == nil)
    }
    
    // pre order
    func print() {
//        Swift.print(value)
//        if let _left = left {_left.print()}
//        if let _right = right {_right.print()}
        var node: Node? = self
        while node?.right != nil {
            Swift.print(node?.right?.value)
            node = node?.right
        }
    }
    
    var minValue: Node {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    var maxValue: Node {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
}

/*
 10
 /    \
 5     14
 /     /  \
 1     11   20
 */

// left
let one = Node(value: 1, left: nil, right: nil)
let five = Node(value: 5, left: one, right: nil)

// right
let eleven = Node(value: 11, left: nil, right: nil)
let twenty = Node(value: 20, left: nil, right: nil)
let Fourteen = Node(value: 14, left: eleven, right: twenty)

// root
let root = Node(value: 10, left: five, right: Fourteen)

func search(node: Node?, value: Int) -> Bool {
    guard let _node = node else {return false}
    if _node.value == value {return true}
    if _node.value < value {
        search(node: _node.right, value: value)
    } else {
        search(node: _node.left, value: value)
    }
    return false
}

func validate(node: Node?) {
    //    guard let _node = node else {return}
    //    let rootValue = _node.value
    //    guard let leftValue = _node.left?.value else {return}
    //    guard let rightValue = _node.right?.value else {return}
    //
    //    if (rootValue > leftValue) && (rootValue < rightValue) {
    //        validate(node: _node.left)
    //        validate(node: _node.right)
    //        print("Valid")
    //    } else {
    //        //        print(rootValue,"   " ,leftValue, "  ", rightValue)
    //        print("Not valid")
    //        return
    //    }
    //
    
    helper(node: node, min: nil, max: nil)
}

func helper(node: Node?, min: Int?, max: Int?) -> Bool {
    guard let root = node else { return true }
    
    if let min = min, root.value <= min { return false }
    if let max = max, root.value >= max { return false }
    
    return helper(node: root.left, min: min, max: root.value) && helper(node: root.right, min: root.value, max: max)
}

//search(node: root, value: 11)
//validate(node: root)


func insert(node: Node?, x: Int) {
    guard let _node = node else {return}
    
    let rootValue = _node.value
    if rootValue > x {
        insert(node: node?.left, x: x)
    } else {
        insert(node: node?.right, x: x)
    }
    
}

func insertIntoBST(_ root: Node?, _ val: Int) -> Node? {
    guard root != nil else  {
        return Node(value: val)
    }
    if val <= root!.value {
        print("Left",root!.value)
        root?.left = insertIntoBST(root?.left, val)
    }else if val >= root!.value {
        print("right",root!.value)
        root?.right = insertIntoBST(root?.right, val)
    }
    return root
}

// insert(node: root, x: 7)

//root.print()
//let x = insert(node: root, x: 7)
let x = insertIntoBST(root, 17)
//print(x?.value)
root.print()



class BST<T: Comparable & CustomStringConvertible> {
    
    private var rootNode: Node?
    
    func addNode(_ value: Int) {
        let node = Node(value: value)
        if let rootNode = self.rootNode {
            self.insert(rootNode, node)
        } else {
            self.rootNode = node
        }
    }
    
    
    private func insert(_ root: Node, _ node: Node) {
        if root.value > node.value {
            if let leftNode = root.left {
                self.insert(leftNode, node)
            } else {
                root.left = node
            }
        } else {
            if let rightNode = root.right {
                self.insert(rightNode, node)
            } else {
                root.right = node
            }
        }
    }
    
    func printTree() {
        self.inorder(self.rootNode)
    }
    
    
    private func inorder(_ node: Node?) {
        guard let _ = node else { return }
        self.inorder(node?.left)
        print("\(node!.value)", terminator: " ")
        self.inorder(node?.right)
    }
}


extension BST {
    func search(value: Int) {
        self.search(self.rootNode, value)
    }
    
    private func search(_ root: Node?, _ element: Int) {
        
        guard let rootNode = root else {
            print("NODE is Not available : \(element)")
            return
        }
        
        print("current root node \(rootNode.value)")
        if element > rootNode.value {
            self.search(rootNode.right, element)
        } else if element < rootNode.value {
            self.search(rootNode.left, element)
        } else {
            print("NODE VALUE AVAILABLE : \(rootNode.value)")
        }
    }
}


//extension BST{

func deleteKey(rootNode: Node?, value: Int) -> Node? {
    return deleteRec(rootNode, value)
}

/* A recursive function to insert a new key in BST */
func deleteRec(_ root: Node?, _ key: Int) -> Node? {
    /* Base Case: If the tree is empty */
    if  root == nil{
        return root
    }
    
    if key < (root?.value)! {
        root?.left = deleteRec(root?.left, key)
    }
    else if key > (root?.value)!{
        root?.right = deleteRec(root?.right, key)
    }
    else
    {
        if root?.left == nil{
            return root?.right
        }
        else if root?.right == nil{
            return root?.left
        }
        
        root?.value = (minValue(root?.right))!
        root?.right = deleteRec(root?.right, (root?.value)!)
    }
    
    return root;
}

 func minValue(_ node: Node?) -> Int? {
    
    var tempNode = node
    
    while let next = tempNode?.left {
        tempNode = next
    }
    return tempNode?.value
}
//}
//print("==============")
//let x1 = deleteKey(rootNode: root, value: 17)
//
//x1?.print()





print("=========")
func  checkIfEqual(f: Node, s: Node) -> Bool {
    f == s
    
}

extension Node: Equatable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.left == rhs.left && lhs.right == rhs.right && lhs.value == rhs.value
    }
}
// Mirror 
//extension TreeNode: Equatable {
//    public static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
//        lhs.val == rhs.val && lhs.left == rhs.right && lhs.right == rhs.left
//    }
//}
checkIfEqual(f: root, s: root)









