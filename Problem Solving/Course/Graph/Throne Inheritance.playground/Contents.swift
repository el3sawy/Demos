import Foundation
//https://leetcode.com/problems/throne-inheritance/
class Queue<T> {
    private var array: [T] = []
    
    func enqueue(_ item: T) {
        array.append(item)
    }
    
    func dequeue() -> T? {
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


class Stack<T> {
    private var array: [T] = []
    
    func push(_ item: T) {
        array.append(item)
    }
    
    func pop() -> T? {
        array.popLast()
    }
    
    func peek() -> T? {
        array.last
    }
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    var count: Int {
        array.count
    }
}


class Graph {
    var v = 0 // Number of vertices
    var adj = [[Int]]() // adjacency list, we can use dictionary instead of array
    
    
    init(_ v: Int) {
        self.v = v
        for _ in 0..<v {
            adj.append([Int]())
        }
    }
    func addEdge(v: Int, w: Int) {
        adj[v].append(w)
    }
    
    func DFS(s: Int) -> [Int] {
        var result: [Int] = []
        
        // Mark all vertices are not visited
        var visited = adj.map {_ in false}
        
        // Create BFS Queue
        let stack = Stack<Int>()
        visited[s] = true
        stack.push(s)
      
        
        while stack.count > 0 {
            let current = stack.pop()!
            result.append(current)
            for n in adj[current] {
                if visited[n] == false {
                    visited[n] = true
                    stack.push(n)
                    
                }
            }
        }
        return result
    }
}




class ThroneInheritance {

    var adj: [String: [String]] = [:]
    private let kingName: String
    private var result: [String] = []
    init(_ kingName: String) {
        adj[kingName] = []
        self.kingName = kingName
    }
    
    func birth(_ parentName: String, _ childName: String) {
        if let _ = adj[parentName] {
            adj[parentName]!.append(childName)
        } else {
            adj[parentName] = [childName]
        }
        
    }
    
    func death(_ name: String) {
        let stack = Stack<String>()
        stack.push(kingName)
        
        while stack.count > 0 {
            let current = stack.pop()!
            
            if let childs = adj[current]?.reversed() {
                var count = 0
                for child in childs {
                    if child == name {
                        let grandChild = adj[name]!
                        
                        adj[current]?.remove(at: count)
                        adj[current]?.insert(contentsOf: grandChild, at: count)
//                        adj[current]?.append(contentsOf: grandChild)
                        // Remove
                        
                        
                       
                        let index = adj.index(forKey: name)!
                        adj.remove(at: index)
                        
                       
                        print(adj)
                    }
                    count += 1
                    stack.push(child)
                }
            }
            
        }
    }
    
    func getInheritanceOrder() -> [String] {
        result = []
        let stack = Stack<String>()
        stack.push(kingName)
        
        while stack.count > 0 {
            let current = stack.pop()!
            result.append(current)
            if let childs = adj[current]?.reversed() {
                for child in childs {
                    stack.push(child)
                }
            }
            
        }
        return result
    }
}


let t = ThroneInheritance("king")
t.birth("king", "andy")
t.birth("king", "bob")
t.birth("king", "catherine")
t.birth("andy", "matthew")
t.birth("bob", "alex")
t.birth("bob", "asha")
t.getInheritanceOrder()

t.death("bob")

t.getInheritanceOrder()
