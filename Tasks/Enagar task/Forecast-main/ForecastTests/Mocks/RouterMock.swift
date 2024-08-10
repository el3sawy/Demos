//
//  RouterMock.swift
//  ForecastTests
//
//  Created by Mohammed Elnaggar on 08/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import UIKit.UIViewController
@testable import Forecast

enum Theme {
    case success
    case warning
    case info
    case error
}

enum RoutingAction: Equatable {
    case present(_ vc: UIViewController.Type)
    case dismiss
    case pop
    case popToRoot
    case popTo(_ vc: UIViewController.Type)
    case push(_ vc: UIViewController.Type)
    case alert(_ message: String)
    case gaveAnAlert
    case alertWithAction((title: String, message: String))
    case showMessage((title: String, message: String, theme: Theme, layout: MessageViewLayout))
    
    static public func ==(lhs: RoutingAction, rhs: RoutingAction) -> Bool {
        switch (lhs, rhs) {
        case let (.popTo(a), .popTo(b)): return a == b
        case let (.present(a), .present(b)): return a == b
        case let (.push(a), .push(b)): return a == b
        case let (.alert(a), .alert(b)): return a == b
        case let (.alertWithAction(a), .alertWithAction(b)):
            return a.title == b.title && a.message == b.message
        case let (.showMessage(a), .showMessage(b)):
            return a.title == b.title && a.message == b.message && a.theme == b.theme
        case (.dismiss, .dismiss),
             (.pop, .pop),
             (.gaveAnAlert, .gaveAnAlert),
             (.popToRoot, .popToRoot):
            return true
        default:
            return false
        }
    }
    
}

final class RouterMock: RouterProtocol {
    
    weak var presentedView: BaseViewController!
    
    var actions: [RoutingAction] = []
    var alertActions: [AlertAction] = []
    
    func present(_ view: UIViewController, shouldBeFullScreen: Bool) {
        actions.append(.present(type(of: view)))
    }
    
    func dismiss() {
        actions.append(.dismiss)
    }
    
    func pop(animated: Bool) {
        actions.append(.pop)
    }
    
    func popToRoot() {
        actions.append(.popToRoot)
    }
    
    func popTo(vc: UIViewController) {
        actions.append(.popTo(type(of: vc)))
    }
    
    func push(_ view: UIViewController) {
        actions.append(.push(type(of: view)))
    }
    
    func alert(title: String, message: String, actions: [(title: String, style: UIAlertAction.Style)]) {
        self.actions.append(.gaveAnAlert)
        self.actions.append(.alert(message))
    }
    
    func alertWithAction(title: String?, message: String?, alertStyle: UIAlertController.Style, actions: [AlertAction]) {
        self.actions.append(.gaveAnAlert)
        self.actions.append(.alertWithAction((title ?? "", message ?? "")))
        self.alertActions.append(contentsOf: actions)
    }
    
    func showSuccess(title: String, message: String, messageLayout: MessageViewLayout) {
        actions.append(.showMessage((title, message, .success, messageLayout)))
    }
    
    func showWarning(title: String, message: String, messageLayout: MessageViewLayout) {
        actions.append(.showMessage((title, message, .warning, messageLayout)))
    }
    
    func showError(error: Error, messageLayout: MessageViewLayout) {
        actions.append(.showMessage(("Error", error.localizedDescription, .error, messageLayout)))
    }
    
    func showError(message: String, messageLayout: MessageViewLayout) {
        actions.append(.showMessage(("Error", message, .error, messageLayout)))
    }
}
