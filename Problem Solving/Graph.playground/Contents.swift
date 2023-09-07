public struct Node<T: Hashable> {
    var data: T
}
extension Node: Hashable {
    static public func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.data == rhs.data
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}

public enum EdgeType {
    case directed, undirected
}


public struct Edge<T: Hashable> {
    public var source: Node<T>
    public var destination: Node<T>
    public let weight: Decimal?
}

extension Edge: Hashable {
    
    static public func ==(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        return lhs.source == rhs.source &&
        lhs.destination == rhs.destination &&
        lhs.weight == rhs.weight
    }
}

protocol Graphable {
    associatedtype Element: Hashable // 1
    var description: CustomStringConvertible { get } // 2
    
    func createNode(data: Element) -> Node<Element> // 3
    func add(_ type: EdgeType, from source: Node<Element>, to destination: Node<Element>, weight: Decimal?) // 4
    func weight(from source: Node<Element>, to destination: Node<Element>) -> Decimal? // 5
    func edges(from source: Node<Element>) -> [Edge<Element>]? // 6
}

open class AdjacencyList<T: Hashable> {
    public var adjacencyDict : [Node<T>: [Edge<T>]] = [:]
    public init() {}
    
    fileprivate func addDirectedEdge(from source: Node<Element>, to destination: Node<Element>, weight: Decimal?) {
        let edge = Edge(source: source, destination: destination, weight: weight) // 1
        adjacencyDict[source]?.append(edge) // 2
    }
    
    fileprivate func addUndirectedEdge(vertices: (Node<Element>, Node<Element>), weight: Decimal?) {
        let (source, destination) = vertices
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
}

extension AdjacencyList: Graphable {
    
    public typealias Element = T
    
    public func createNode(data: Element) -> Node<Element> {
        let node = Node(data: data)
        
        if adjacencyDict[node] == nil {
            adjacencyDict[node] = []
        }
        
        return node
    }
    public var description: CustomStringConvertible {
        var result = ""
        for (node, edges) in adjacencyDict {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(node) ---> [ \(edgeString) ] \n ")
        }
        return result
    }
    
    func add(_ type: EdgeType, from source: Node<T>, to destination: Node<T>, weight: Decimal?) {
        switch type {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(vertices: (source, destination), weight: weight)
        }
    }
    
    func weight(from source: Node<T>, to destination: Node<T>) -> Decimal? {
        guard let edges = adjacencyDict[source] else { // 1
            return nil
        }
        
        for edge in edges { // 2
            if edge.destination == destination { // 3
                return edge.weight
            }
        }
        
        return nil // 4
    }
    
    func edges(from source: Node<T>) -> [Edge<T>]? {
        return adjacencyDict[source]
    }
}





//let singapore = adjacencyList.createNode(data: "Singapore")
//let tokyo = adjacencyList.createNode(data: "Tokyo")
//let hongKong = adjacencyList.createNode(data: "Hong Kong")
//let detroit = adjacencyList.createNode(data: "Detroit")
//let sanFrancisco = adjacencyList.createNode(data: "San Francisco")
//let washingtonDC = adjacencyList.createNode(data: "Washington DC")
//let austinTexas = adjacencyList.createNode(data: "Austin Texas")
//let seattle = adjacencyList.createNode(data: "Seattle")
//
//adjacencyList.add(.undirected, from: singapore, to: hongKong, weight: 300)
//adjacencyList.add(.undirected, from: singapore, to: tokyo, weight: 500)
//adjacencyList.add(.undirected, from: hongKong, to: tokyo, weight: 250)
//adjacencyList.add(.undirected, from: tokyo, to: detroit, weight: 450)
//adjacencyList.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
//adjacencyList.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
//adjacencyList.add(.undirected, from: detroit, to: austinTexas, weight: 50)
//adjacencyList.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
//adjacencyList.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
//adjacencyList.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
//adjacencyList.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
//adjacencyList.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)

import Foundation
class Currency {
    var from: String = ""
    var value: Decimal = 0.0
    var to: String = ""
    var nameAll: String = ""
    init(from: String, value: Decimal, to: String, nameAll: String) {
        self.from = from
        self.value = value
        self.to = to
        self.nameAll = nameAll
    }
}

func splitCurrency(_ value: String) -> (from: String, to: String) {
    let from = String(value.prefix(3))
    let to = String(value.suffix(3))
    return (from, to)
}

func fillArray(arr: [String: Decimal]) -> [Currency] {
    var currency: [Currency] = []
    arr.forEach({ value in
        let names = splitCurrency(value.key)
        let item = Currency(from: names.from, value: value.value, to: names.to, nameAll: value.key)
        currency.append(item)
    })
    return currency
}
let adjacencyList = AdjacencyList<String>()
func find(pair: String, rates: [String: Decimal]) -> (rate: Decimal, route: String) {
    let currencyArray = fillArray(arr: rates)
    if let result = normalFind(pari: pair, arrCurrency: currencyArray) {
        return result
    } else {
        let names = splitCurrency(pair)
        let from = names.from
        let to = names.to
        
        
        currencyArray.forEach({ item in
            let formNode = adjacencyList.createNode(data: item.from)
            let toNode = adjacencyList.createNode(data: item.to)
            adjacencyList.add(.directed, from: formNode, to: toNode, weight: item.value)
        })
        //
        adjacencyList.breadthFirstSearch(from: adjacencyList.createNode(data: "USD") , to: adjacencyList.createNode(data: "RUB"))
        return (1.1, "")
    }
}

func normalFind(pari: String, arrCurrency: [Currency]) -> (rate: Decimal, route: String)? {
    guard let item = arrCurrency.first(where: {$0.nameAll == pari}) else {return nil}
    return (item.value, item.to)
}

print(adjacencyList.description)

extension Graphable {
    public func breadthFirstSearch(from source: Node<Element>, to destination: Node<Element>) -> [Edge<Element>]? {
        var queue = Queue<Node<Element>>()
        queue.push(source)
        let visits : [Node<Element> : Visit<Element>] = [source: .source] // 1
        
        while let visitedVertex = queue.pop() { // 2
            if visitedVertex == destination {
              var vertex = destination // 1
              var route: [Edge<Element>] = [] // 2

              while let visit = visits[vertex],
                case .edge(let edge) = visit { // 3

                route = [edge] + route
                vertex = edge.source // 4

              }
              return route // 5
            }

          }
          return nil
      }
}

func breadthFirstSearch(_ graph: Graph, source: Node<String>) -> [String] {
  var queue = Queue<Node>()
  queue.enqueue(source)

  var nodesExplored = [source.label]
  source.visited = true

  while let node = queue.dequeue() {
    for edge in node.neighbors {
      let neighborNode = edge.neighbor
      if !neighborNode.visited {
        queue.enqueue(neighborNode)
        neighborNode.visited = true
        nodesExplored.append(neighborNode.label)
      }
    }
  }

  return nodesExplored
}
 find(pair: "USDRUB", rates: ["GBPRUB": 100, "USDGBP": 0.7, "GBPEUR": 0.83, "EURRUB": 86.3])
//find(pair: "", rates: ["s":101])
print()


enum Visit<Element: Hashable> {
  case source
  case edge(Edge<Element>)
}



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




//
//func levelOrder(_ root: node?) -> [[Int]] {
    //        if root == nil {
    //            return []
    //        }
    //        var map: [Int: [Int]] = [:]
    //        var queue: [(TreeNode?, Int)] = [(root, 0)]
    //        while !queue.isEmpty {
    //            let element = queue.removeFirst()
    //            let node = element.0
    //            map[element.1, default: [Int]()].append(node?.val ?? 0)
    //            if node?.left != nil {
    //                queue.append((node?.left, element.1 + 1))
    //            }
    //            if node?.right != nil {
    //                queue.append((node?.right, element.1 + 1))
    //            }
    //        }
    //
    //        var array: [[Int]] = []
    //        for key in map.keys.sorted(by: { $0 < $1 }) {
    //            array.append(map[key] ?? [])
    //        }
    //
    //        return array
//    }


/*
 class Solution {
     func numIslands(_ grid: [[Character]]) -> Int {
         if grid == nil || grid.count == 0 { return 0 }
         
         var grid = grid
         var result = 0
         let n = grid.count
         let m = grid[0].count
         
         for row in 0..<n {
             for col in 0..<m {
                 if String(grid[row][col]) == "1" {
                     result += 1
                     mapIsland(row, col, &grid)
                 }
             }
         }
         
         return result
     }
     
     func mapIsland(_ row: Int, _ col: Int, _ grid: inout [[Character]]) {
         
         var stack = [(row: Int, col: Int)]()
         stack.append((row: row, col: col))
         
         while !stack.isEmpty {
             let pos = stack.removeLast()
             if pos.row > 0 && String(grid[pos.row - 1][pos.col]) == "1" {
                 stack.append((row: pos.row - 1, col: pos.col))
                 grid[pos.row - 1][pos.col] = "0"
             }
             if pos.row + 1 < grid.count && String(grid[pos.row + 1][pos.col]) == "1" {
                 stack.append((row: pos.row + 1, col: pos.col))
                 grid[pos.row + 1][pos.col] = "0"
             }
             if pos.col > 0 && String(grid[pos.row][pos.col - 1]) == "1" {
                 stack.append((row: pos.row, col: pos.col - 1))
                 grid[pos.row][pos.col - 1] = "0"
             }
             if pos.col + 1 < grid[pos.row].count && String(grid[pos.row][pos.col + 1]) == "1" {
                 stack.append((row: pos.row, col: pos.col + 1))
                 grid[pos.row][pos.col + 1] = "0"
             }
         }
     }
 }
 */
 
