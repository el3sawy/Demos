//
//  ListProductViewTsets.swift
//  TDDPlayTests
//
//  Created by NTG on 07/06/2023.
//

import XCTest
@testable import TDDPlay

final class ListProductViewTsets: XCTestCase {
    
    private var sut: ListProductViewController!
    private var presenter: ListProductPresenterMock!
    override func setUpWithError() throws {
        presenter = ListProductPresenterMock()
        sut = ListProductViewController()
        sut.presenter = presenter
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        presenter = nil
    }
    
    func test_TableView_Config() {
        // Then
        XCTAssertIdentical(sut.tableView.dataSource, sut)
        XCTAssertIdentical(sut.tableView.delegate, sut)
    }
    
    func test_numberOfRows_EqualToCountInPresenter() {
        // When
        let rows = sut.tableView.numberOfRows(inSection: 0)
        // Then
        XCTAssertEqual(rows, presenter.numberOfRows)
    }
    
    func test_tableView_dequeue_ProductCell() {
        
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? ProductCell
        XCTAssertNotNil(cell)
    }
    
    func test_tableView_ProductCell() {
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ProductCell
        
        let item: ProductUiModel = cell.item
        let firstItem =  ProductSTUB.getProducts()[0]
        XCTAssertEqual(item.title, firstItem.title)
        XCTAssertEqual(item.subTitle, firstItem.subTitle)
        XCTAssertEqual(item.imageURL, firstItem.imageURL)
    }
    
    func test_tableView_didSelect_callGetItems_presentDetailsView() {
        sut.tableView.delegate?.tableView?(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(presenter.isCalledGetItem)
    }
    
    func test_viewDidLoad_callFetchProduct() {
        sut.viewDidLoad()
        XCTAssertTrue(presenter.isCalledFetchProduct)
    }
    
    func test_didFetchProducts() {
        let mockTableView = TableViewMock()
        sut.tableView = mockTableView
        sut.didFetchProducts()
        XCTAssertTrue(mockTableView.isCalledReloadData)
    }
}


class ListProductPresenterMock: ListProductPresenterProtocol {
    var numberOfRows: Int = 1
    var isCalledGetItem = false
    var isCalledFetchProduct = false
    func getItem(at index: Int) -> ProductUiModel {
        isCalledGetItem.toggle()
        return ProductSTUB.getProducts()[index]
    }
    
    func fetchProducts() {
        isCalledFetchProduct = true
    }
}

enum ProductSTUB {
    static func getProducts() -> [ProductUiModel] {
        [
            .init(title: "Ahmed", subTitle: "Naguib", imageURL: "Nego"),
            .init(title: "Ahmed1", subTitle: "Naguib1", imageURL: "Nego1"),
            .init(title: "Ahmed2", subTitle: "Naguib2", imageURL: "Nego2")
        ]
    }
    
    
    static func getJSON(bundle: Bundle, for jsonName: String) -> Data {
        guard let path = bundle.path(forResource: jsonName, ofType: "json") else {
            fatalError("Could not retrieve file \(jsonName).json")
        }
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        return data
    }
    
    
   static func getResponse() -> [ProductResponseModel] {
      let data = getJSON(bundle: Bundle.testBundle, for: "Response_Model")
       let response = try? JSONDecoder().decode([ProductResponseModel].self, from: data)
       return response ?? []
    }

}

class TableViewMock: UITableView {
    var isCalledReloadData = false
    override func reloadData() {
        isCalledReloadData.toggle()
    }
}


extension Bundle {
    public class var testBundle: Bundle {
        return Bundle(for: TDDPlayTests.self)
    }
}
