import UIKit

class ComicsDataSource: NSObject {
    let viewModel: CharacterComicsViewModelProtocol
    
    init(viewModel: CharacterComicsViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    func configure(_ collectionView: UICollectionView) {
        collectionView.dataSource = self
        collectionView.register(ComicsCollectionViewCell.nib, forCellWithReuseIdentifier: ComicsCollectionViewCell.identifier)
    }
}

extension ComicsDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let comic = viewModel.items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComicsCollectionViewCell.identifier, for: indexPath) as! ComicsCollectionViewCell
        cell.configure(comic: comic)
        return cell
    }
    
    
}
