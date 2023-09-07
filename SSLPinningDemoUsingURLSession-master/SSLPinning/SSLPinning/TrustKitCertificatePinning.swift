//
//  File.swift
//  SSLPinning
//
//  Created by Ahmed Elesawy on 10/10/2021.
//  Copyright © 2021 Anuj Rai. All rights reserved.
//

import TrustKit

//final class TrustKitCertificatePinning: NSObject, URLSessionDelegate {
//
//    /// URLSession with configured certificate pinning
//    lazy var session: URLSession = {
//        URLSession(configuration: URLSessionConfiguration.ephemeral,
//                   delegate: self,
//                   delegateQueue: OperationQueue.main)
//    }()
//
//
//
//    override init() {
//        TrustKit.initSharedInstance(withConfiguration: trustKitConfig)
//        super.init()
//    }
//
//    // MARK: TrustKit Pinning Reference
//
//    func urlSession(_ session: URLSession,
//                    didReceive challenge: URLAuthenticationChallenge,
//                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//
//        if TrustKit.sharedInstance().pinningValidator.handle(challenge, completionHandler: completionHandler) == false {
//            // TrustKit did not handle this challenge: perhaps it was not for server trust
//            // or the domain was not pinned. Fall back to the default behavior
//            completionHandler(.performDefaultHandling, nil)
//        }
//    }
//}
