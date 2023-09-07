import Foundation
import Darwin
class Node<T> {
     var value: T
     var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}


struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    init() {}
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        tail = tail!.next
        
    }
    
    func node(at index: Int) -> Node<Value>? {
        var currentIndex = 0
        var currentNode = head
        while(currentNode != nil && currentIndex < index  ) {
            
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    
    mutating func insert(_ value: Value, index: Int) {
        guard let node = node(at: index) else {
            return
        }
        node.next = Node(value: value, next: node.next)
    }
    
    func print() {
        var currentItem = head
        while(currentItem != nil) {
            currentItem = currentItem?.next
        }
    }
}


//var list = LinkedList<Int>()
//list.append(1)
//list.append(2)
//list.append(13)
//list.append(4)
//
//
//list.insert(10, index: 3)
//print(list.node(at: 1)?.value)
////list.print()

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    func print() {
        var currentItem = next
        while currentItem != nil {
            Swift.print(currentItem?.val)
            currentItem = currentItem?.next
        }
    }
    func reverse() {
        
    }
 }

let list1 = ListNode(1)
let list2 = ListNode(2,list1)
let list3 = ListNode(3,list2)
let list4 = ListNode(4,list3)

list4.print()

// Reverse
