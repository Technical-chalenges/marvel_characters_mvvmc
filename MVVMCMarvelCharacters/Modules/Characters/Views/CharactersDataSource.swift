import UIKit

class CharactersDataSource: NSObject {
    static let loadingSectionIndex = 1
    let viewModel: CharactersViewModelProtocol
    
    init(viewModel: CharactersViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    func configure(tableView: UITableView) {
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(CharacterCell.nib, forCellReuseIdentifier: CharacterCell.identifier)
        tableView.register(LoadingCell.nib, forCellReuseIdentifier: LoadingCell.identifier)
    }
}

extension CharactersDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == CharactersDataSource.loadingSectionIndex) {
            return viewModel.isLoading ? 1 : 0
        } else {
            return viewModel.items.count
        }
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        if indexPath.section == CharactersDataSource.loadingSectionIndex {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: LoadingCell.identifier,
                for: indexPath
            ) as! LoadingCell
            
            cell.activityIndicator.startAnimating()
            return cell
        }
        
        let model = viewModel.items[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CharacterCell.identifier,
            for: indexPath
        ) as! CharacterCell
        
        cell.character = model
        cell.addToFavorite = viewModel.addToFavorite
        cell.removeFromFavorite = viewModel.removeFromFavorite

        return cell
    }
}
