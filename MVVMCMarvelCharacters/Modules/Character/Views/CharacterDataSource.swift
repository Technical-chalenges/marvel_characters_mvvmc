import UIKit

class CharacterDataSource: NSObject {
    let viewModel: CharacterViewModelProtocol
    
    init(viewModel: CharacterViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    func configure(_ tableView: UITableView) {
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.register(CharacterInfoCell.nib, forCellReuseIdentifier: CharacterInfoCell.identifier)
        tableView.register(CharacterInfoDescriptionlessCell.nib, forCellReuseIdentifier: CharacterInfoDescriptionlessCell.identifier)
        tableView.register(CharacterComicsCell.nib, forCellReuseIdentifier: CharacterComicsCell.identifier)
        tableView.register(CharacterSeriesCell.nib, forCellReuseIdentifier: CharacterSeriesCell.identifier)
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
            let viewModel = section as! CharacterInfoViewModelProtocol
            if viewModel.description != "" {
                let cell = tableView.dequeueReusableCell(withIdentifier: CharacterInfoCell.identifier, for: indexPath) as! CharacterInfoCell
                cell.configure(vm: viewModel)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: CharacterInfoDescriptionlessCell.identifier, for: indexPath) as! CharacterInfoDescriptionlessCell
                cell.configure(vm: viewModel)
                return cell
            }
        case .comics:
            let cell = tableView.dequeueReusableCell(withIdentifier: CharacterComicsCell.identifier, for: indexPath) as! CharacterComicsCell
            cell.configure(vm: section as! CharacterComicsViewModelProtocol)
            return cell
        case .series:
            let cell = tableView.dequeueReusableCell(withIdentifier: CharacterSeriesCell.identifier, for: indexPath) as! CharacterSeriesCell
            cell.configure(vm: section as! CharacterSeriesViewModelProtocol)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = viewModel.sections[section]
        return section.sectionTitle
    }
}
