//
//  ExamViewController.swift
//  MultipleChoiceQuestions
//
//  Created by Ahmed Elesawy on 19/02/2023.
//

import UIKit

class ExamViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "AnswersCollectionViewCell", bundle: nil), forCellReuseIdentifier: "AnswersCollectionViewCell")
            tableView.register(UINib(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderView")
            tableView.delegate = self
            tableView.dataSource = self
            tableView.rowHeight = 50
            



        }
    }
    
    var items = QuestionModel.getData()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ExamViewController: UITableViewDelegate {
    
}


extension ExamViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        items.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items[section].choices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswersCollectionViewCell") as! AnswersCollectionViewCell
        let item = items[indexPath.section].choices[indexPath.row]
        cell.item = item
        return cell
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
        headerView.item = items[section]
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
}
