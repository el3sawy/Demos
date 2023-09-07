//
//  DownloadOperation.swift
//  DownloadLargeFile
//
//  Created by Ahmed Elesawy on 22/10/2022.
//

import Foundation
//https://lb.aait-d.com//tiktalent//public//storage//files//video//1654418937Social_Media_R.mp4
class DownloadOperation: BaseOperation {
 
    let url: URL
    let sessionConfiguration = URLSessionConfiguration.default
    lazy var session: URLSession = {
        let session = URLSession(configuration: sessionConfiguration,
                                 delegate: self,
                                 delegateQueue: nil)
        return session
    }()
    
    var downloadTask: URLSessionDownloadTask?
    
    init(url: URL) {
        self.url = url
    }
    
    override func execute() {
        downloadTask = session.downloadTask(with: url)
        downloadTask?.resume()
        finish()
    }
}

extension DownloadOperation: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        
        let userInfo: [String: Any] = [
            "progress" : progress,
            "totalBytesWritten" : totalBytesWritten,
            "totalBytesExpectedToWrite" : totalBytesExpectedToWrite
        ]
        
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .downloadProgress,
                                            object: self,
                                            userInfo: userInfo)
        }
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print("Did complete.  error? \(error)")
        finish()
    }
    
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        let ext = downloadTask.currentRequest?.url?.pathExtension ?? "mp4"
        let uuid = UUID()
        let dir = offlineLocation
        
        if !FileManager.default.fileExists(atPath: dir.path) {
            try! FileManager.default.createDirectory(at: dir, withIntermediateDirectories: false, attributes: nil)
        }
        
        let filename = "\(uuid.uuidString).\(ext)"
        let targetLocation = dir.appendingPathComponent(filename)
        
        try! FileManager.default.moveItem(at: location, to: targetLocation)
        let attribs = try! FileManager.default.attributesOfItem(atPath: targetLocation.path)
        
//        downloadInfo.progress = 1.0
            
//        if let sizeNumber = attribs[FileAttributeKey.size] as? NSNumber {
//            downloadInfo.sizeInBytes = sizeNumber.int64Value
//        }
//
//        downloadInfo.path = targetLocation.path
        print(targetLocation.path)
    }
    
     var offlineLocation: URL {
        let docsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        return URL(fileURLWithPath: docsDir).appendingPathComponent(".downloads", isDirectory: true)
    }
}
