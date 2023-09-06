//
//  Alert.swift
//  TestPresentViewController
//
//  Created by Ahmed Elesawy on 12/01/2022.
//

import UIKit

typealias AlertHandler = (UIAlertAction) -> Void

class AlertPresenter {
    private var actionHandlers = [UIAlertAction: AlertHandler]()

    func addAction(titled title: String,
                   style: UIAlertAction.Style,
                   handler: AlertHandler?) {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        actionHandlers[action] = handler
    }

    func present(title: String, message: String, on controller: UIViewController) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        actionHandlers.keys.forEach({ alert.addAction($0) })
        controller.present(alert, animated: false, completion: nil)
    }

    func handler(for action: UIAlertAction) -> AlertHandler? {
        return actionHandlers[action]
    }
}
