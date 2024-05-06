//
//  ViewController.swift
//  InAppMessagesDemo
//
//  Created by Ahmed Naguib on 30/04/2024.
//

import UIKit
import FirebaseInAppMessaging
import SwiftUI

class ViewController: UIViewController, InAppMessagingDisplayDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        InAppMessaging.inAppMessaging().delegate = self
    }
    
    func messageClicked(_ inAppMessage: InAppMessagingDisplayMessage, with action: InAppMessagingAction) {
        
        // get here 
        print(action.actionURL?.absoluteString)
        let appData = inAppMessage.appData
        //        print(appData)
        print(appData)
        
    }
//    -FIRDebugEnabled
    
    func messageDismissed(_ inAppMessage: InAppMessagingDisplayMessage, dismissType: FIRInAppMessagingDismissType) {
        
        
        
    }
    
    
    @IBAction func btn(_ sender: Any) {
        InAppMessaging.inAppMessaging().triggerEvent("inappmessaging_compose_ee")
//        let vc = UIHostingController(rootView: AcreenShotView())
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true)
    }
    

}

