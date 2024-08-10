//
//  Constants.swift
//  IPSAssignment
//
//  Created by Mahmoud Abdulwahab on 24/03/2023.
//

import Foundation

public enum Constants {
    /// Retrieve Lessons URL
    ///
    static var baseURL: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "Info", ofType: "plist") else {
                fatalError("Couldn't find file 'Info.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "Base_URL") as? String else {
                fatalError("Couldn't find key 'BASE_URL' in 'Info.plist'.")
            }
            return value
        }
    }
    
    /// No Internet Connection Error Code
    ///
    static let offlineErrorCode = -1009
}
