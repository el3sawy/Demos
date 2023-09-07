// Binary tree
// Binary Search Tree
// BST is binary tree but the left less than right
// BST is O(log n) base 2

import Foundation

class Node {
    var key: Int = 0
    var left: Node?
    var right: Node?
    
    init(key: Int) {
        self.key = key
    }
    
    var min: Node {
        if left == nil {
            return self
        } else {
            return left!.min
        }
    }
    
    var max: Node {
        if right == nil {
            return self
        } else {
            return right!.max
        }
    }
    
    func isLeaf(_ node: Node?) -> Bool {
        return node?.left == nil && node?.right == nil
    }
    
    func height(node: Node?) -> Int {
        if isLeaf(node) {
            return 0
        } else {
            return 1 + Swift.max(height(node: node?.left), height(node: node?.right))
        }
    }
}

class BST {
    var root: Node?
}

//Traversal
extension BST {
    
    // Preorder
    func printPostOrderTraversal() {
        postOrderTraversal(node: root)
    }
    private func postOrderTraversal(node: Node?) {
        guard let node = node else { return }
        postOrderTraversal(node: node.left)
        postOrderTraversal(node: node.right)
        print(node.key)
    }
    
    // Preorder
    func printPreOrderTraversal() {
        preOrderTraversal(node: root)
    }
    private func preOrderTraversal(node: Node?) {
        guard let node = node else { return }
        print(node.key)
        preOrderTraversal(node: node.left)
        preOrderTraversal(node: node.right)
    }
    
    // Inorder
    func printInOrderTraversal() {
        inOrderTraversal(node: root)
    }
    private func inOrderTraversal(node: Node?) {
        guard let node = node else { return }
        inOrderTraversal(node: node.left)
        print(node.key)
        inOrderTraversal(node: node.right)
    }
}

// Deletion
extension BST {
    func delete(key: Int) {
        guard let _ = root else { return }
        root = delete(&root, key: key)
    }
    
    private func delete(_ node: inout Node?, key: Int) -> Node? {
        guard let _node = node else { return nil }
        
        if key < _node.key {
            _node.left = delete(&_node.left, key: key)
        } else if key > _node.key {
            _node.right =  delete(&_node.right, key: key)
        } else {  // equal
            // Case 1 no child
            if _node.left == nil && _node.right == nil {
                node = nil
            }
            
            // Case 2: has one  child
            else if node?.left == nil {
                node = _node.right
            }
            else if node?.right == nil {
                node = _node.left
            }
            // Case 3 has two child
            // Find the min value in the right or max value in the left
            else {
                let minRight = _node.right!.min
                _node.key = minRight.key
                _node.right = delete(&_node.right, key: _node.key)
            }
        }
        return nil
    }
}

// Insert
extension BST {
    func insert(_ key: Int) {
        root = insertItem(root, key: key)
    }
    
    private func insertItem(_ node: Node?, key: Int) -> Node {
        guard let node = node else {
            let node = Node(key: key)
            return node
        }
        
        if key < node.key {
            node.left = insertItem(node.left, key: key)
        } else {
            node.right = insertItem(node.right, key: key)
        }
        return node
    }
    
}
// Search
extension BST {
    func find(key: Int) -> Int? {
        guard let root = root else { return nil}
        return find(root, key: key)?.key
    }
    
   private func find(_ node: Node?, key: Int) -> Node? {
        guard let node = node else { return nil }
        
        if node.key == key {
            return node
        } else if key > node.key {
            find(node.right, key: key)
        } else {
            find(node.left, key: key)
        }
        // Duplicated values not allowed
        return nil
    }
}


// Testing
let bst = BST()
bst.insert(5)
bst.insert(3)
bst.insert(2)
bst.insert(4)
bst.insert(7)
bst.insert(6)
bst.insert(8)

bst.printPreOrderTraversal()
