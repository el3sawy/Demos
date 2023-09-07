//
//  ListProductPresenterTsets.swift
//  TDDPlayTests
//
//  Created by NTG on 07/06/2023.
//

import XCTest
@testable import TDDPlay

final class ListProductPresenterTsets: XCTestCase {

    private var sut: ListProductPresenter!
    var useCase: ListProductUseCaseMock!
    private var view: ListProductViewMock!
    
    override func setUpWithError() throws {
        useCase = ListProductUseCaseMock()
        view = ListProductViewMock()
        sut = ListProductPresenter(useCase: useCase, view: view)
    }

    override func tearDownWithError() throws {
       sut = nil
    }
    
    func test_fetchProducts_successResponse() {
        useCase.simultateSuccessResposne()
        
        sut.fetchProducts()
        XCTAssertEqual(sut.numberOfRows, 3)
        XCTAssertTrue(view.isCalleShowLoader)
        XCTAssertTrue(view.isCalleHideLoader)
        XCTAssertTrue(view.didCalledDidFetchProducts)
    }
    
    func test_getItem() {
        useCase.simultateSuccessResposne()
        
        sut.fetchProducts()
        let pro = sut.getItem(at: 0)
        XCTAssertEqual(pro, ProductSTUB.getProducts()[0])
    }
    
    
    func test_fetchProducts_simultateFailResposne() {
        useCase.simultateFailResposne()
        sut.fetchProducts()
        XCTAssertTrue(view.didCalledShowError)
    }

}

class ListProductUseCaseMock: ListProductUseCaseProtocol {
    private var result: Result<[ProductUiModel], Error>!
    func simultateSuccessResposne() {
        result = .success(ProductSTUB.getProducts())
    }
    
    func simultateFailResposne() {
        result = .failure(NetworkError.interServerError)
    }
    func fetchProducts(completion: @escaping ProductBlock) {
        completion(result)
    }
}



class ListProductViewMock: ListProductViewProtocol {
    var isCalleShowLoader = false
    var isCalleHideLoader = false
    var didCalledDidFetchProducts = false
    var didCalledShowError = false
    
    func didFetchProducts()  {
        didCalledDidFetchProducts.toggle()
    }
    func showLoader() {
        isCalleShowLoader.toggle()
    }
    func hodeLoader() {
        isCalleHideLoader.toggle()
    }
    func showError(message: String) {
        didCalledShowError.toggle()
       
    }
}
