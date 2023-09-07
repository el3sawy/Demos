//
//  ListCityViewController.swift
//  WeatherRxApp
//
//  Created by Ahmed Elesawy on 02/04/2022.
//

import UIKit
import RxSwift
import RxCocoa

class ListCityViewController: UIViewController {
    enum PendingStatus:String, CaseIterable {
        case pending = "pending"
        case pendingActivation = "pending_activation"
        case pendingDeactivation = "pending_deactivation"
    }
    enum PendingStatu: String {
        case pending = "pending"
        case pendingActivation = "pending_activation"
        case pendingDeactivation = "pending_deactivation"
    }
    @IBOutlet weak var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //        let net = ListCityRepository(network: Network())
        //        net.fetchWeatherBy(city: "cairo") { res in
        //            switch  res {
        //
        //            case .success(let value):
        //                print(value)
        //            case .error(let error):
        //                print(error)
        //            }
        bindTextField()
        let c = PendingStatus(rawValue: "")
        let xx:PendingStatu = .pending
        let x = PendingStatus.allCases.first(where: {$0.rawValue == PendingStatu.pending.rawValue})
    }
    
    func bindTextField() {
        txtName.rx.text.orEmpty
            .filter { !$0.isEmpty }
            .subscribe(onNext: { text in
              print(text)
            })
    }
    
}

