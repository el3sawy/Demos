//
//  GraphProtocol.swift
//  Graph
//
//  Created by Ahmed Elesawy on 08/03/2022.
//

import Foundation

protocol GraphProtocol {
    associatedtype Element: Hashable
    func createNode(data: Element) -> Node<Element>
    func addDirectedEdge(from: Node<Element>, to: Node<Element>, weight: Double?)
    func addUnDirectedEdge(from: Node<Element>, to: Node<Element>, weight: Double?)
    func add(type: EdgeType, from: Node<Element>, to: Node<Element>, weight: Double?)
    func edges(from: Node<Element>) -> [Edge<Element>]
    func weight(from: Node<Element>, to: Node<Element>) -> Double?
}

extension GraphProtocol {
    func addUnDirectedEdge(from: Node<Element>, to: Node<Element>, weight: Double?) {
        addDirectedEdge(from: from, to: to, weight: weight)
        addDirectedEdge(from: to, to: from, weight: weight)
    }
}
