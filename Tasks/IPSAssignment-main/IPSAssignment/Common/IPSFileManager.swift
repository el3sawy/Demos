//
//  IPSFileManager.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 26/03/2023.
//

import Foundation

class IPSFileManager {
    
    // MARK: - Properties
    
    static let shared = IPSFileManager()
    
    private init() {}
    
    // MARK: - Public Methods
    
    private func getDocumentsDirectory() -> URL {
        let url =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return url
    }
    
    
    func saveVideoToFile(at url: URL, fileName: String) throws  {
        let destinationURL = getDocumentsDirectory().appendingPathComponent(fileName)
        do {
            if  FileManager.default.fileExists(atPath: destinationURL.path) {
                try FileManager.default.removeItem(at: destinationURL)
            }
            try FileManager.default.copyItem(at: url, to: destinationURL)
            debugPrint("File moved successfully ✅")
        } catch {
            debugPrint("Error moving file:", error.localizedDescription, "❌")
            throw error
        }
    }
    
    func getVideoURLFromCache(fileName: String, fileExtension: String) throws -> URL {
        let documentsUrl = getDocumentsDirectory()
        do {
            let videoFiles = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles).filter{ $0.pathExtension == fileExtension && $0.lastPathComponent == fileName  }
            if let videoUrl = videoFiles.first {
                return videoUrl
            }
        } catch {
            debugPrint("❌: Error while enumerating files \(documentsUrl.path): \(error.localizedDescription)")
            throw IPSErrors.withMessage("\(error.localizedDescription)")
        }
        debugPrint("❌: File not found")
        throw IPSErrors.fileNotFound
    }
}
