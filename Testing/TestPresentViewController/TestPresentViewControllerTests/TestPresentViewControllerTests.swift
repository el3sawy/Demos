//
//  TestPresentViewControllerTests.swift
//  TestPresentViewControllerTests
//
//  Created by Ahmed Elesawy on 11/01/2022.
//

import XCTest
import ViewControllerPresentationSpy
@testable import TestPresentViewController

class TestPresentViewControllerTests: XCTestCase {

    var sut: ProdcutsViewController!
//    private var alertVerifier: AlertVerifier!
    override func setUpWithError() throws {
        
       
        sut = ProdcutsViewController()
        sut.loadViewIfNeeded()
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        keyWindow?.rootViewController = sut
//        alertVerifier = AlertVerifier()
//        UIApplication.shared.windows.first?.rootViewController = sut
    }

    override func tearDownWithError() throws {
//        alertVerifier = nil
        sut = nil
       
        
    }
    
    func test_PresentDetailsViewController() {
        sut.btnDetailsOutlet.sendActions(for: .touchUpInside)
        XCTAssert(sut.presentedViewController is DetailsViewController)
    }
    
    func test_PresentAlert() {
        
        sut.btnAlertOutlet.sendActions(for: .touchUpInside)
        XCTAssert(sut.presentedViewController is UIAlertController)
        
    }
    
    func test_AlertActionsPersnt2() throws {
        
       
        
//        alertVerifier.verify(title: "Do the Thing?", message: "Let us know if you want to do the thing.", animated: true, actions: [
//            .cancel("Cancel"),
//            .default("OK")
//        ], presentingViewController: sut)
//
//
//        XCTAssertEqual(alertVerifier.preferredAction?.title, "OK", "preferred action")
    }
    func test_AlertActions() throws {
//        let expction = expectation(description: "Com")
//        let alertVerifier: AlertVerifier = AlertVerifier()
//        sut.btnAlertOutlet.tapped()
//        try alertVerifier.executeAction(forButton: "OK")
//        alertVerifier.
//        alertVerifier.testCompletion = {
//            expction.fulfill()
//        }
//
//
////        waitForExpectations(timeout: 5, handler: nil)
//        wait(for: [expction], timeout: 1)
//        XCTAssert(sut.presentedViewController is DetailsViewController)
        
        
        
        
        
        
        
    }

}



extension UIButton {
    func tapped() {
        sendActions(for: .touchUpInside)
    }
}
