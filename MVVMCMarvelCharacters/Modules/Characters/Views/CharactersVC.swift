//
//  CharactersVC.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 20.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class CharactersVC: UIViewController, Storyboarded {
    static var storyboard = AppStoryboard.characters
    
    var viewModel: CharactersVMP? {
        didSet {
            initByViewModel()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource: CharactersDataSource!
    
    private var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.addTarget(self, action: #selector(refreshCharacters(_:)), for: .valueChanged)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        initByViewModel()
    }
    
    func initByViewModel() {
        guard let viewModel = viewModel, let tableView = tableView else { return }
        dataSource = CharactersDataSource(viewModel: viewModel)
        dataSource.configure(tableView)
        title = viewModel.title
        viewModel.reloadCharacters()
    }
    
    @objc private func refreshCharacters(_ sender: Any) {
        viewModel?.reloadCharacters()
    }
}

extension CharactersVC: PaginableViewDelegate {
    func itemsDidLoad() {
        refreshControl.endRefreshing()
        tableView.reloadData()
    }
}
