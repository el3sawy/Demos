//
//  ListChatsViewController.swift
//  ChatApp
//
//  Created by Ahmed Elesawy on 28/02/2023.
//

import UIKit

public class ListChatsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: ListChatsViewViewModel!
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = viewModel.fetchChats()
    }
}

extension ListChatsViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Will navigate to chat and pass chat id
        // Navigation by Coordinator
    }
}

