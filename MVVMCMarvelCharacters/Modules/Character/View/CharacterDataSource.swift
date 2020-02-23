//
//  CharacterDataSource.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 23.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class CharacterDataSource: NSObject {
    let viewModel: CharacterVMP
    
    init(viewModel: CharacterVMP) {
        self.viewModel = viewModel
    }
    
    func configure(_ tableView: UITableView) {
        tableView.dataSource = self
        tableView.register(CharacterInfoCell.nib, forCellReuseIdentifier: CharacterInfoCell.identifier)
        tableView.register(CharacterComicsCell.nib, forCellReuseIdentifier: CharacterComicsCell.identifier)
    }
}


extension CharacterDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = viewModel.sections[indexPath.section]
        
        switch section.sectionType {
        case .info:
            let cell = tableView.dequeueReusableCell(withIdentifier: CharacterInfoCell.identifier, for: indexPath) as! CharacterInfoCell
            cell.configure(vm: section as! CharacterInfoVMP)
            return cell
        case .comics:
            let cell = tableView.dequeueReusableCell(withIdentifier: CharacterComicsCell.identifier, for: indexPath) as! CharacterComicsCell
            cell.configure(vm: section as! CharacterComicsVMP)
            return cell
        default:
            print("")
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = viewModel.sections[section]
        return section.sectionTitle
    }
}
