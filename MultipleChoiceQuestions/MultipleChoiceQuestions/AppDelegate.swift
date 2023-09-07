//
//  AppDelegate.swift
//  MultipleChoiceQuestions
//
//  Created by Ahmed Elesawy on 19/02/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = ExamViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

