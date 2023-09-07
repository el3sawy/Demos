//
//  ServiceManager.swift
//  SSLPinning
//
//  Created by Anuj Rai on 26/01/20.
//  Copyright © 2020 Anuj Rai. All rights reserved.
//

import Foundation

class ServiceManager: NSObject {
    func callAPI(withURL url: URL, isCertificatePinning: Bool, completion: @escaping (String) -> Void) {
        let session = URLSession(configuration: .ephemeral, delegate: PinningServer(), delegateQueue: nil)
        //        TrustKit.initSharedInstance(withConfiguration: trustKitConfig)
        
        var responseMessage = ""
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("error: \(error!.localizedDescription): \(error!)")
                responseMessage = "Pinning failed"
                print(NSURLErrorFailingURLStringErrorKey)
                let errorCode = (error as NSError?)?.code ?? 0
                if errorCode == NSURLErrorCancelled {
                    print("dsldasjdjasd adjadas,da daldas,dasda dasdl")
                }
//                if error == NSURLErrorFailingURLStringErrorKey {
//
//                }
            } else if data != nil {
                let str = String(decoding: data!, as: UTF8.self)
                print("Received data:\n\(str)")
                if isCertificatePinning {
                    responseMessage = "Certificate pinning is successfully completed"
                }else {
                    responseMessage = "Public key pinning is successfully completed"
                }
            }
            
            DispatchQueue.main.async {
                completion(responseMessage)
            }
            
        }
        task.resume()
        
    }
}
