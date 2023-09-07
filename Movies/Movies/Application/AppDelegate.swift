//
//  AppDelegate.swift
//  Movies
//
//  Created by Ahmed Elesawy on 08/12/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupRootViewController()
        return true
    }
    
    private func setupRootViewController() {
        window = UIWindow()
        let rootView = MovieConfigurator.getViewController(with: .listMovies)
//        RootRouter.root.destinationViewController
        let navigation = UINavigationController(rootViewController: rootView)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}
