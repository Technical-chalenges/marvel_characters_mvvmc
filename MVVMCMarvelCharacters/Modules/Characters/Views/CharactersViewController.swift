//
//  CharactersVC.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 20.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: CharactersVMP!
    var tableViewDataSource: CharactersDataSource!
    var tableViewDelegate: InfiniteViewDelegate!
    private var refreshControl = UIRefreshControl()
    
    init(viewModel: CharactersVMP) {
        self.viewModel = viewModel
        self.tableViewDataSource = CharactersDataSource(viewModel: viewModel)
        super.init(nibName: "CharactersViewController", bundle: nil)
        self.title = viewModel.title
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        title = viewModel.title
        
        tableViewDataSource = CharactersDataSource(viewModel: viewModel)
        tableViewDataSource.configure(tableView)
        
        tableViewDelegate = InfiniteViewDelegate(direction: .vertical, sensivity: 0.8)
        tableViewDelegate.EndReachedClosure = viewModel.loadCharacters
        tableViewDelegate.rowSelectedClosure = showCharacter
        tableViewDelegate.configure(tableView: tableView)
    }
    
    func showCharacter(indexPath: IndexPath) {
        viewModel.showCharacter(index: indexPath.row)
    }
    
    @objc private func refreshCharacters(_ sender: Any) {
        viewModel?.reloadCharacters()
    }
}

extension CharactersViewController: PaginableViewDelegate {
    func itemsDidLoad() {
        refreshControl.endRefreshing()
        tableView.reloadData()
    }
}
