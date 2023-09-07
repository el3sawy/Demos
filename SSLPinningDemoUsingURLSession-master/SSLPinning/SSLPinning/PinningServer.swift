//
//  PinningServer.swift
//  Mobile HV
//
//  Created by Ahmed Elesawy on 13/10/2021.
//  Copyright © 2021 Mohamed Sayeh. All rights reserved.
//

import Foundation
import TrustKit
class PinningServer: NSObject, URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        guard let serverTrust = challenge.protectionSpace.serverTrust else { return }
        if isServerCertValid(serverTrust) {
            completionHandler(.useCredential, URLCredential(trust:serverTrust))
        } else {
            completionHandler(.cancelAuthenticationChallenge, nil)
        }
    }
    func isServerCertValid(_ trust: SecTrust) -> Bool {
     let pinningValidator = TrustKit.sharedInstance().pinningValidator
        var  trustDecision = TSKTrustDecision.domainNotPinned
      let momaindes =   ["web.vodafone.com.eg", "www.google.com"]
        for i in 0...momaindes.count - 1 {
            trustDecision = pinningValidator.evaluateTrust(trust, forHostname:  momaindes[i])
            if trustDecision == .shouldAllowConnection {break}
        }
      
//            if trustDecision == .shouldAllowConnection {break}
        
//     let trustDecision = pinningValidator.evaluateTrust(trust, forHostname: "mhv.vodafone.de")
        
     return trustDecision == .shouldAllowConnection
   }
static func pinningServerFailed(error: Error?) -> Bool {
        if let responseError = error {
            let errorCode = (responseError as NSError?)?.code ?? 0
            if errorCode == NSURLErrorCancelled {
                return true
            }
        }
        return false
    }
}
