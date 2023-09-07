//
//  AdjacencyList.swift
//  Graph
//
//  Created by Ahmed Elesawy on 12/03/2022.
//

import Foundation

class AdjacencyList<T: Hashable>: GraphProtocol {
    
    private var adjacencies: [Node<T>: [Edge<T>]] = [:]
    
    init() {
        
    }
    
    func createNode(data: T) -> Node<T> {
        let node = Node(data: data)
        if adjacencies[node] == nil {
            adjacencies[node] = []
        }
        return node
    }
    
    func addDirectedEdge(from: Node<T>, to: Node<T>, weight: Double?) {
        let edge = Edge(from: from, to: to, wight: weight)
        adjacencies[from]?.append(edge) // add new edge
    }
    
    func add(type: EdgeType, from: Node<T>, to: Node<T>, weight: Double?) {
        switch type {
        case .directed:
            addDirectedEdge(from: from, to: to, weight: weight)
        case .undirected:
            addUnDirectedEdge(from: from, to: to, weight: weight)
        }
    }
    
    func edges(from: Node<T>) -> [Edge<T>] {
        return adjacencies[from] ?? []
    }
    
    func weight(from: Node<T>, to: Node<T>) -> Double? {
        return adjacencies[from]?.first(where: {$0.to == to})?.wight
    }
}

extension AdjacencyList: CustomStringConvertible {
    var description: String {
        var result: String = ""
        for (node, edges) in adjacencies {
            var edgeString = ""
            for (_, edge) in edges.enumerated() {
                edgeString.append("\(edge.wight ?? 0.0) \(edge.to) , ")
//                if index != edges.count - 1 {
//                    edgeString.append("\(edge.to) weight = \(edge.wight ?? 0.0),  ")
//                } else {
//                    edgeString.append("\(edge.to) weight = \(edge.wight ?? 0.0)")
//                }
            }
            result.append("\(node) ---> [\(edgeString)] \n")
        }
        return result
    }
}
