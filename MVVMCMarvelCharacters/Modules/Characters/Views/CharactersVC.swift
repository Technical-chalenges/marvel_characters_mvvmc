//
//  CharactersVC.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 20.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class CharactersVC: ControllerVC, Storyboarded {
    static var storyboard = AppStoryboard.characters
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: UITableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    override func initByViewModel(with vm: BaseVMP?) {
        super.initByViewModel(with: vm)
        guard let vm = vm as? CharactersVM else { return }
        vm.reloadCharacters()
    }
}

extension CharactersVC: PaginableViewDelegate {
    func itemsDidLoad() {
        guard let vm = viewModel as? CharactersVM else { return }
        dataSource = TableViewDataSource(models: vm.items, reuseIdentifier: CharacterCell.identifier) { (character, cell) in
            guard let characterCell = cell as? CharacterCell else { return }
            characterCell.configure(character: character)
        }
        
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
}
