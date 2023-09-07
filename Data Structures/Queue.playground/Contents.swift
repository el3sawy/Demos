
protocol QueueProtocol {
    associatedtype T
    mutating func push(_ item: T)
    mutating func pop() -> T?
    func peek() -> T?
    var count: Int {get}
    var isEmpty: Bool {get}
}

struct Queue<T>:  QueueProtocol {
    private var storage = [T]()
    mutating func push(_ item: T) {
        storage.append(item)
    }
    
    mutating func pop() -> T? {
        storage.removeFirst()
    }
    
    func peek() -> T? {
        storage.first
    }
    
    var count: Int {
        storage.count
    }
    
    var isEmpty: Bool {
        storage.isEmpty
    }
}

var stack = Queue<Int>()
stack.push(0)
stack.push(1)
stack.push(3)

stack.pop()
stack.peek()
stack.count
stack.isEmpty

