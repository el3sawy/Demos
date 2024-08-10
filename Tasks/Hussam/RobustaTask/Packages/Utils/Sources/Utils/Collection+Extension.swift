//
//  Collection+Extension.swift
//  
//
//  Created by Hussam Elsadany on 02/04/2023.
//

public extension Collection where Indices.Iterator.Element == Index {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
