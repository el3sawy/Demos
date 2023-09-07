import Foundation
class Node<T> {
    var value: T
    var next: Node?
    init(value: T) {
        self.value = value
    }
}
class Stack<T> {
    var head: Node<T>?
    
}
