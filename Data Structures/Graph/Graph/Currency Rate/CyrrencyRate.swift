//
//  CyrrencyRate.swift
//  Graph
//
//  Created by Ahmed Elesawy on 12/03/2022.
//

import Foundation

class CurrencyRate {
    //["GBPRUB": 100, "USDGBP": 0.7, "GBPEUR": 0.83, "EURRUB": 86.3]
    
   static func find(pair: String, rates: [String: Double]) -> (rate: Double, route: String) {
       let adjacencyList = AdjacencyList<String>()
       
        for (nodes, weight) in rates {
            let nodesNames = splitCurrency(nodes)
            
            let source = adjacencyList.createNode(data: nodesNames.from)
            let destination = adjacencyList.createNode(data: nodesNames.to)
            adjacencyList.add(type: .directed, from: source, to: destination, weight: weight)
        }
       print(adjacencyList)
       print("======")
       let f = Node(data: "USD")
       let s = Node(data: "RUB")
       print(adjacencyList.weight(from: f, to: s))
        return (1.1, "")
    }
    private static func splitCurrency(_ value: String) -> (from: String, to: String) {
        let from = String(value.prefix(3))
        let to = String(value.suffix(3))
        return (from, to)
    }
}
