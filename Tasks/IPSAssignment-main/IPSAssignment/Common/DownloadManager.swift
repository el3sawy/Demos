//
//  DownloadManager.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 26/03/2023.
//

import Foundation

class DownloadManager: NSObject {
    let url: URL
    let videoName: String
    private lazy var downloadSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration, delegate: nil, delegateQueue: .main)
    }()
    
    private var continuation: AsyncStream<Event>.Continuation?
    
    private lazy var task: URLSessionDownloadTask = {
        let task = downloadSession.downloadTask(with: url)
        task.delegate = self
        return task
    }()
    
    init(url: URL, videoName: String) {
        self.url = url
        self.videoName = videoName
    }
    
    var events: AsyncStream<Event> {
        AsyncStream { continuation in
            self.continuation = continuation
            task.resume()
            continuation.onTermination = { @Sendable [weak self] _ in
                self?.task.cancel()
            }
        }
    }
    
    func cancelProcess() {
        task.cancel()
    }
}

extension DownloadManager {
    enum Event {
        case progress(currentBytes: Int64, totalBytes: Int64)
        case success
    }
}

extension DownloadManager: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        continuation?.yield( .progress(
            currentBytes: totalBytesWritten,
            totalBytes: totalBytesExpectedToWrite))
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        saveVideoToFile(at: location)
        continuation?.yield(.success)
        continuation?.finish()
    }
}

extension DownloadManager {
    
    private func getDocumentsDirectory() -> URL {
        let url =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return url
    }
    
    func saveVideoToFile(at url: URL)   {
        let destinationURL = getDocumentsDirectory().appendingPathComponent(videoName)
        do {
            if  FileManager.default.fileExists(atPath: destinationURL.path) {
                try FileManager.default.removeItem(at: destinationURL)
            }
            try FileManager.default.copyItem(at: url, to: destinationURL)
            debugPrint("File moved successfully ✅")
        } catch {
            debugPrint("Error moving file:", error.localizedDescription, "❌")
        }
    }
}
