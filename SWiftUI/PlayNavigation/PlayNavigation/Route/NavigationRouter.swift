//
//  NavigationRouter.swift
//  PlayNavigation
//
//  Created by NTG Clarity on 02/08/2024.
//

import SwiftUI

final class NavigationRouter: ObservableObject {
    
    @Published var routes: [Route] = []
    
    func push(to screen: Route) {
        guard !routes.contains(screen) else {
            return
        }
        routes.append(screen)
    }
    
    func pop() {
        _ = routes.popLast()
    }
    func reset() {
        routes = []
    }
    
    func printCount() {
        print(routes.count)
    }
    
    func currentView() -> Bool {
        if let last = routes.last {
            return last == .studentItem(item: Student.mock[0])
        }
        return false
    }
    
    func replace(_ route: [Route]) {
        routes = route
    }
}
