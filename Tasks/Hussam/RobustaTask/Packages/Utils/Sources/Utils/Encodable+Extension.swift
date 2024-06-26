//
//  Encodable+Extension.swift
//  
//
//  Created by Hussam Elsadany on 02/04/2023.
//

import Foundation

public extension Encodable {
    var storeData: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
}

class SelectPaymentMethodPresenter: NSObject {
    private let ePGWrapper: EPGWrapper = .init()
    
    func navigateToEPG(withPaymentResponse response: CreatePaymentResponse) {
      
        let dependency: EPGViewController.Dependencies = .init()
        ePGWrapper.delegate = self
        if let _ = self.billsAndRechargesRequest{
            dependency.paymentFlow = .billAndRecharge
        }else if let _ = self.selectedLifeStylePlan {
            dependency.paymentFlow = .bogoSubscription
        } else{
            dependency.paymentFlow = .food
        }
        
        let viewController = ePGWrapper.getEPGViewController(dependency: dependency, response: response)
        router?.navigateToViewController(viewController: viewController)
    }
}


@objc final class EPGWrapper: NSObject {
    private var epgViewController: EPGViewController? = EPGViewController.instantiate(fromAppStoryboard: .EPG)
    
    private func subscribeDelegate() {
        guard let epgViewController else {
            return
        }
        epgViewController.EPGPaymentSummaryState
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
            guard let self else {
                return
            }
            switch state {
                
            case .errorMessage(message: let message, viewController: let viewController, errorCode: let errorCode, errorTitle: let errorTitle):
                self.delegate?.didReceiveErrorMessage(message, viewController: viewController, errorCode: errorCode, errorTitle: errorTitle)
            case .cartStatusDetailsResponse(response: let response, viewController: let viewController):
                self.delegate?.didGetCartStatusDetailsResponse(response, viewController: viewController)
            case .iftarMealResponse(response: let response, viewController: let viewController):
                self.delegate?.didGetIftarMealResponse(response, viewController: viewController)
            case .paymentResponse(response: let response, viewController: let viewController):
                self.delegate?.didGetPaymentResponse(response, viewController: viewController)
            }
        }.store(in: &cancallabels)
    }
}


final class EPGViewController: UIViewController {
    
    private var paymentSummarySubject = PassthroughSubject<EPGPaymentSummaryState, Never>()
}
