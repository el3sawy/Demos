//
//  AddToDoViewController.swift
//  ToDoAppRx
//
//  Created by Ahmed Elesawy on 26/03/2022.
//

import UIKit
import RxSwift

class AddToDoViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    
    private var toDoSubject = PublishSubject<ToDoModel>()
    var todoSubjectObservable: Observable<ToDoModel> {
        return toDoSubject.asObservable()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        let type = Types(rawValue: segment.selectedSegmentIndex ) ?? .flaunt
        let newTodd = ToDoModel(type: type, title: txtTitle.text ?? "", name: txtMessage.text ?? "")
        toDoSubject.onNext(newTodd)
        dismiss(animated: true, completion: nil)
    }
}
