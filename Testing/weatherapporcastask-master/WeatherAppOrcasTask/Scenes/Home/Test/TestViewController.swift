//
//  TestViewController.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 01/08/2021.
//

import Foundation
import LocalAuthentication
import UIKit
import CryptoSwift
import KeychainSwift


class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let keychain = KeychainSwift()
//        keychain.set("Hello world", forKey: "uuid", withAccess: .accessibleWhenUnlocked)
        
       
        
        let encryptMessage = encryptMessage(message: "Hello World!", encryptionKey: "mykeymykeymykey1", iv: "myivmyivmyivmyiv")
        // Output of encryptMessage is: 649849a5e700d540f72c4429498bf9f4

        let decryptedMessage = decryptMessage(encryptedMessage: encryptMessage ?? "", encryptionKey: "mykeymykeymykey1", iv: "myivmyivmyivmyiv")
        
        print(encryptMessage)
        print(decryptedMessage)
    }
     func encryptMessage(message: String, encryptionKey: String, iv: String) -> String? {
         if let aes = try? AES(key: encryptionKey, iv: iv),
             let encrypted = try? aes.encrypt(Array<UInt8>(message.utf8)) {
             return encrypted.toHexString()
         }
         return nil
     }

      func decryptMessage(encryptedMessage: String, encryptionKey: String, iv: String) -> String? {
         if let aes = try? AES(key: encryptionKey, iv: iv),
             let decrypted = try? aes.decrypt(Array<UInt8>(hex: encryptedMessage)) {
             return String(data: Data(bytes: decrypted), encoding: .utf8)
         }
         return nil
     }
    
   

}

extension Data {
    func aesEncrypt(key: String, iv: String) throws -> Data{
        let encypted = try AES(key: key.bytes, blockMode: CBC(iv: iv.bytes), padding: .pkcs7).encrypt(self.bytes)
        return Data(bytes: encypted)
    }

    func aesDecrypt(key: String, iv: String) throws -> Data {
        let decrypted = try AES(key: key.bytes, blockMode: CBC(iv: iv.bytes), padding: .pkcs7).decrypt(self.bytes)
        return Data(bytes: decrypted)
    }
}
