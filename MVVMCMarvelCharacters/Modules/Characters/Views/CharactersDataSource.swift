//
//  CharactersDataSource.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 22.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation
import UIKit

class CharactersDataSource: NSObject {
    let viewModel: CharactersVMP
    
    init(viewModel: CharactersVMP) {
        self.viewModel = viewModel
    }
    
    func configure(tableView: UITableView) {
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        tableView.register(CharacterCell.nib, forCellReuseIdentifier: CharacterCell.identifier)
    }
}

extension CharactersDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.items[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CharacterCell.identifier,
            for: indexPath
        ) as! CharacterCell
        
        cell.configure(character: model)

        return cell
    }
}
