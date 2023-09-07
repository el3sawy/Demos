import Foundation
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
    
    func BFS(s: Int) -> [Int] {
        var result: [Int] = []
        
        // Mark all vertices are not visited
        var visited = adj.map {_ in false}
        
        // Create BFS Queue
        let queue = Queue<Int>()
        visited[s] = true
        queue.enqueue(s)
        result.append(s)
        
        while queue.count > 0 {
            let current = queue.dequeue()!
            
            for n in adj[current] {
                if visited[n] == false {
                    visited[n] = true
                    queue.enqueue(n)
                    result.append(n)
                }
            }
        }
        return result
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

let g = Graph(8)
g.addEdge(v: 0, w: 1)
g.addEdge(v: 1, w: 0)

g.addEdge(v: 1, w: 4)
g.addEdge(v: 4, w: 1)

g.addEdge(v: 4, w: 6)
g.addEdge(v: 6, w: 4)

g.addEdge(v: 6, w: 0)
g.addEdge(v: 0, w: 6)

g.addEdge(v: 1, w: 5)
g.addEdge(v: 5, w: 1)

g.addEdge(v: 5, w: 3)
g.addEdge(v: 3, w: 5)

g.addEdge(v: 3, w: 0)
g.addEdge(v: 0, w: 3)

g.addEdge(v: 5, w: 2)
g.addEdge(v: 2, w: 5)

g.addEdge(v: 2, w: 7)
g.addEdge(v: 7, w: 2)

g.BFS(s: 0)
g.DFS(s: 0)





/*
 1- Edge List => Search O(n) easy
 2- Adjacency Matrix => Search O(n) no space for it
 3- Adjacency List => Fast , easy
 
 */
