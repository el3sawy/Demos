//
//  DownloadController.swift
//  DownloadLargeFile
//
//  Created by Ahmed Elesawy on 25/10/2022.
//

import Foundation

class DownloadController {
    let downloadQueue: OperationQueue
    
    static let shared = DownloadController()
    
    private init() {
        downloadQueue = OperationQueue()
        downloadQueue.maxConcurrentOperationCount = 1
    }
    
    func download(url: String) {
  
        let operation = DownloadOperation(url: URL(string: url)!)
        downloadQueue.addOperation(operation)
    }
}
