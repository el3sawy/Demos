//
//  Router.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import UIKit.UIViewController
import SwiftMessages

public final class Router: RouterProtocol {
    
    public weak var presentedView: BaseViewController!
    
    public func present(_ view: UIViewController, shouldBeFullScreen: Bool) {
        if shouldBeFullScreen { view.modalPresentationStyle = .fullScreen }
        presentedView?.present(view, animated: true, completion: nil)
    }
    
    public func dismiss() {
        presentedView?.dismiss(animated: true, completion: nil)
    }
    
    public func pop(animated: Bool) {
        presentedView?.navigationController?.popViewController(animated: animated)
    }
    
    public func popToRoot() {
        presentedView?.navigationController?.popToRootViewController(animated: true)
    }
    
    public func popTo(vc: UIViewController) {
        presentedView?.navigationController?.popToViewController(vc, animated: true)
    }
    
    public func push(_ view: UIViewController) {
        presentedView?.navigationController?.pushViewController(view, animated: true)
    }
    
    public func alert(title: String, message: String, actions: [(title: String, style: UIAlertAction.Style)]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions
            .map { UIAlertAction(title: $0.title, style: $0.style, handler: nil) }
            .forEach { alert.addAction($0)}
        
        presentedView?.present(alert, animated: true, completion: nil)
    }
    
    public func alertWithAction(title: String?,
                                message: String?,
                                alertStyle: UIAlertController.Style,
                                actions: [AlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        actions.map { action in
            UIAlertAction(title: action.title, style: action.style) { _ in
                action.action()
            }
        }.forEach { alert.addAction($0) }
        
        presentedView?.present(alert, animated: true, completion: nil)
    }
    
    public func showSuccess(title: String, message: String, messageLayout: MessageViewLayout = .statusLine) {
        SwiftMessages.show(message: .statusBarMessage(title: title, body: message, messageLayout: messageLayout, theme: .success))
    }
    
    public func showWarning(title: String, message: String, messageLayout: MessageViewLayout = .statusLine) {
        SwiftMessages.show(message: .statusBarMessage(title: title, body: message, messageLayout: messageLayout, theme: .warning))
    }
    
    public func showError(error: Error, messageLayout: MessageViewLayout = .statusLine) {
        let errorMessage = error.localizedDescription.components(separatedBy: ":")
        SwiftMessages.show(message: .statusBarMessage(title: "Error", body: errorMessage.count > 0 ? errorMessage[1] : error.localizedDescription, messageLayout: messageLayout, theme: .error))
    }
    
    public func showError(message: String, messageLayout: MessageViewLayout = .statusLine) {
        SwiftMessages.show(message: .statusBarMessage(title: "Error", body: message, messageLayout: messageLayout, theme: .error))
    }
}

private extension SwiftMessages {
    static func show(message: SystemMessage) {
        Self.show(config: message.config, view: message.view)
    }
}
