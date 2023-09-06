//
//  HomeViewController.swift
//  WeatherAppOrcasTask
//
//  Created by Ahmed Elesawy on 2/16/21.
//

class Ahmed {
    
}
class Test {
    
}

import UIKit
protocol HomeViewProtocol: BaseViewProtocol {
    func successFeatchData()
    func dataFromLcocal()
    func retryFeatchData()
}
class dd: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .red
    }
}
class HomeViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtCityName: UITextField!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var lblDataNotAcurate: UILabel!
    
    //MARK:- Variables
    private var presenter: HomePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iniTableView()
        setViews()
    }
    
    //MARK:- Functions
    private func setViews() {
        indicator.isHidden = true
        indicator.layer.cornerRadius = 10
        lblDataNotAcurate.isHidden = true
    }
    
    //MARK:- Buttons Tapped
    @IBAction func btnSearchTapped(_ sender: Any) {
        view.endEditing(true)
        presenter.featchWeatherBy(city: txtCityName.text)
    }
}

//MARK:- init TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    private func iniTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: WeatherCell.self)
        tableView.rowHeight = 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: WeatherCell.self, for: indexPath)
        presenter.config(cell, at: indexPath.row)
        return cell
    }
}

//MARK:- Delegate for presenter
extension HomeViewController: HomeViewProtocol {
    func successFeatchData() {
        lblDataNotAcurate.isHidden = true
        tableView.reloadData()
    }
    
    func dataFromLcocal() {
        lblDataNotAcurate.isHidden = false
        tableView.reloadData()
    }
    
    func retryFeatchData() {
        showErrorVC(deleget: self)
    }
    
    func showIndicator() {
        indicator.isHidden = false
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.isHidden = true
        indicator.stopAnimating()
    }
    
    func showMessage(message: String) {
     alertButton(message: message)
    }
}

extension HomeViewController: ErrorProtocol {
    func reloadData() {
        presenter.featchWeatherBy(city: txtCityName.text)
    }
}
extension HomeViewController {
    class func create() -> HomeViewController {
        let network = Network()
        let localStorage = LocalStorage()
        let authRepository = HomeRepository(network: network, localStorage: localStorage)
        let view = HomeViewController()
        let presenter = HomePresenter(view: view, repo: authRepository)
        view.presenter = presenter
        return view
    }
}
