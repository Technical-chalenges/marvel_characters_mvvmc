//
//  ViewController.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 23.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class CharacterVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel: CharacterVMP
    let dataSource: CharacterDataSource
    
    init(viewModel: CharacterVMP) {
        self.viewModel = viewModel
        self.dataSource = CharacterDataSource(viewModel: viewModel)
        super.init(nibName: "CharacterVC", bundle: nil)
        self.title = viewModel.name
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.configure(tableView)
        tableView.reloadData()
    }
}
