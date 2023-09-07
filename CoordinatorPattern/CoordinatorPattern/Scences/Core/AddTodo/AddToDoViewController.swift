//
//  AddToDoViewController.swift
//  CoordinatorPattern
//
//  Created by NTG on 20/06/2023.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var titleTextFiled: UITextField!
    
    weak var coordinator: CoreCoordinatorProtocol?
    
    init(coordinator: CoreCoordinatorProtocol?) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func addNewTapped(_ sender: Any) {
        let model: ToDoModel = .init(
            title: titleTextFiled.text ?? "",
            details: detailsTextView.text)
        
        coordinator?.addNewTodo(model: model)
    }
}
