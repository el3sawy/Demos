//
//  UIViewConroller+.swift
//  SwizzlingDemo
//
//  Created by Ahmed Elesawy on 04/12/2022.
//

import UIKit

extension UIViewController {
    
    @objc func trackViewWillApper() {
        print("Tracker this Screen ", type(of: self) )
        trackViewWillApper()
    }
    static func swizzle() {
        let originalSelector = #selector(UIViewController.viewDidLoad)
        let swizzledSelector = #selector(UIViewController.trackViewWillApper)
        let originalMethod = class_getInstanceMethod(self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        method_exchangeImplementations(originalMethod!, swizzledMethod!)
    }
}
