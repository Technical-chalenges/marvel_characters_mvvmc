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
            let cell = tableView.dequeueReusableCell(withIdentifier: CharacterInfoCell.identifier) as! CharacterInfoCell
            cell.configure(vm: section as! CharacterInfoVMP)
            return cell
        default:
            print("")
            return UITableViewCell()
        }
    }
}
