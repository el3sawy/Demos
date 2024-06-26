//
//  RouterProtocol.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//

public typealias AlertAction = (title: String, style: UIAlertAction.Style, action: () -> Void)

import UIKit.UIViewController

public protocol RouterProtocol: AnyObject {
    
    var presentedView: BaseViewController! { set get }
    func present(_ view: UIViewController, shouldBeFullScreen: Bool)
    func dismiss()
    func pop(animated: Bool)
    func popToRoot()
    func popTo(vc: UIViewController)
    func push(_ view: UIViewController)
    func alert(title: String, message: String, actions: [(title: String, style: UIAlertAction.Style)])
    func alertWithAction(title: String?, message: String?, alertStyle: UIAlertController.Style, actions: [AlertAction])
    func showSuccess(title: String, message: String, messageLayout: MessageViewLayout)
    func showWarning(title: String, message: String, messageLayout: MessageViewLayout)
    func showError(error: Error, messageLayout: MessageViewLayout)
    func showError(message: String, messageLayout: MessageViewLayout)
}
