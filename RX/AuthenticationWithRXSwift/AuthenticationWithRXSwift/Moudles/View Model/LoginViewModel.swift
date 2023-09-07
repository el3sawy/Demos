//
//  LoginViewModel.swift
//  AuthenticationWithRXSwift
//
//  Created by Ahmed Elesawy on 04/10/2021.
//

import Foundation
import RxSwift
import RxCocoa

struct Student {
    let name: [String]
    let age: [Int]
}
class LoginViewModel {
    //    private var userName: BehaviorRelay<String>
    let namesSubject = PublishSubject<[String]>()
    let agesSubject = PublishSubject<[Int]>()
    let studentSubject = PublishSubject<Student>()
    
    let dis = DisposeBag()
    init() {
        Observable.combineLatest(namesSubject, agesSubject).map{ names, ages in
            return Student(name: names, age: ages)
        }.bind(to: studentSubject)
        .disposed(by: dis)
        
        
        let table = UITableView()
        let cell = UITableViewCell()
        studentSubject.bind(to: table.rx.items(cellIdentifier: "", cellType: UITableViewCell.self)){_,_,_ in
            
        }
    }
    
    
    
}
