import Foundation

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkedList {
    private var head: Node?
    
    init(head: Node? = nil) {
        self.head = head
    }
    
    func addFront(_ data: Int) { // O(1)
        head = Node(data, next: head)
    }
    
    func getFirst() -> Int? { // O(1)
        return head?.data ?? 0
    }
    
    func addBack(_ data: Int) { // O(n)
        let lastNode = getLastNode()
        lastNode?.next = Node(data)
    }
    
    private func getLastNode() -> Node? { // O(n)
        guard var currentNode = head else { return head }
        while currentNode.next != nil {
            currentNode = currentNode.next!
        }
        return currentNode
    }
    
    func getLast() -> Int? { // O(n)
        return getLastNode()?.data
    }
    
    func insertPosition(position: Int, data: Int) {
        if position == 0 {
            addFront(data)
            return
        }
        var currentNode = head
        for _ in 0..<position - 1 {
            currentNode = currentNode?.next
        }
        
        let nextNode = currentNode?.next
        let newNode = Node(data, next: nextNode)
        currentNode?.next = newNode
    }
    
    func deleteFirst() {
        head = head?.next
    }
    
    func deleteLast() {
        var nextNode = head
        var previousNode: Node?
        
        while nextNode?.next != nil {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        previousNode?.next = nil
    }
    
    func delete(at position: Int) {
        if position == 0 {
            deleteFirst()
            return
        }
        
        var nextNode = head
        var previousNode: Node?
        for _ in 0..<position {
            previousNode = nextNode
            nextNode = nextNode?.next
            
        }
        previousNode?.next = nextNode?.next
    }
    
    var isEmpty: Bool {
        head == nil
    }
    
    func clear() {
        head = nil
    }
    
    func length() -> Int {
        var leng = 1
        var currentNode = head
        
        while currentNode?.next != nil {
            leng += 1
            currentNode = currentNode?.next
        }
        return leng
    }
    
    func printLinkedList() -> [Int] {
        var result: [Int] = []
        guard var node = head else {
            return result
        }
        
        result.append(node.data)
        while node.next != nil {
            node = node.next!
            result.append(node.data)
        }
        return result
    }
    
    func reversePrintLinkedList(head: Node?) {
        guard let node = head else { return }
        
        reversePrintLinkedList(head: node.next)
        print(node.data)
    }
    
}

//let node3 = Node(4)
//let node2 = Node(2, next: node3)
//let node1 = Node(1, next: node2)
//
//
//let linked = LinkedList(head: node1)
//linked.length()
//linked.printLinkedList()




// --------------- Merge linked List
//https://leetcode.com/problems/intersection-of-two-linked-lists/

let node6 = Node(6)
let node5 = Node(5, next: node6)
let node4 = Node(4, next: node5)
let node3 = Node(3, next: node4)
let node2 = Node(2, next: node3)
let node1 = Node(1, next: node2)


let node11 = Node(11, next: node4)
let node10 = Node(10, next: node11)

let link1 = LinkedList(head: node1)
let link2 = LinkedList(head: node10)

link1.printLinkedList()
link2.printLinkedList()

func getIntersectionNode(_ headA: Node?, _ headB: Node?) -> Node? {
    
    var temp1 = headA
    var temp2 = headB
    
    var lenA = 0
    var lenB = 0
    
    while temp1 != nil {
        lenA += 1
        temp1 = temp1?.next
    }
    
    while temp2 != nil {
        lenB += 1
        temp2 = temp2?.next
    }
    
    var diff = abs(lenA - lenB)
    
    temp1 = headA
    temp2 = headB
    if lenA > lenB {
        while diff  > 0 {
            temp1 = temp1?.next
            diff -= 1
        }
    } else {
        while diff > 0 {
            temp2 = temp2?.next
            diff -= 1
        }
    }
    
    
    while temp1 !==  temp2 {
        temp1 = temp1?.next
        temp2 = temp2?.next
        print("ee")
        if temp2 == nil || temp1 == nil {
            return nil
        }
    }
    
    
    return temp1
}

getIntersectionNode(node1, node10)?.data

// has cycle
//https://leetcode.com/problems/linked-list-cycle/submissions/
func hasCycle(_ head: Node?) -> Bool {
    var slow = head
    var fast = head?.next
    
    while slow != nil, fast != nil {
        guard slow !== fast else { return true }
        
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    return false
}



//isPalindrome

//https://leetcode.com/problems/palindrome-linked-list/

func isPalindrome(_ head: Node?) -> Bool {
    
    let link = LinkedList(head: head)
    let arr = link.printLinkedList()
    let count = arr.count
    
    for i in 0..<count / 2 {
        if arr[i] != arr[count - i  - 1] {
            return false
        }
    }
    
    return true
}


// Remove duplicate

func deleteDuplicates(_ head: Node?) -> Node? {
    var set = Set<Int>()
    
    var current = head
    var previous: Node?
    var node = Node(head!.data)
    while current?.next != nil {
        if set.contains(current!.data) {
            previous?.next = current?.next
        } else {
            set.insert(current!.data)
            previous = current
            
        }
        
        current = current?.next
    }
    
    return current
}


func deleteDuplicates1(_ head: Node?) -> Node? {
        var current = head
        var last: Node?
        
        while current != nil {
            if last != nil && current!.data == last!.data {
                last?.next = current?.next
            
            } else {
                last = current
            }
            
            current = current?.next
        }
        
        return last
    }

let node_3 = Node(1)
let node_2 = Node(2, next: node_3)
let node_1 = Node(1, next: node_2)

deleteDuplicates1(node_1)

let l  = LinkedList( head: deleteDuplicates(node_1))
l.printLinkedList()



