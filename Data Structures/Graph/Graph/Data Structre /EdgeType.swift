//
//  EdgeType.swift
//  Graph
//
//  Created by Ahmed Elesawy on 08/03/2022.
//

import Foundation

enum EdgeType {
    case directed
    case undirected
}

struct Edge<T: Hashable> {
    var from: Node<T>
    var to: Node<T>
    var wight: Double?
}

