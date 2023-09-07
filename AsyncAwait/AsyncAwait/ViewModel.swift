//
//  ViewModel.swift
//  AsyncAwait
//
//  Created by NTG on 08/07/2023.
//

import Foundation


class ViewModel {
    
    func getFeeds() async -> [String] { 
        
        return await withCheckedContinuation { continuation in
            DispatchQueue.global().async {
                continuation.resume(returning: ["A", "B", "C"])
            }
        }
    }
}
