//
//  Node.swift
//  Graph
//
//  Created by Ahmed Elesawy on 08/03/2022.
//

import Foundation

struct Node<T: Hashable> {
    var data: T
//    var index: Int
}

extension Node: Hashable {
    
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.data == rhs.data
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        return "\(data)"
    }
}
