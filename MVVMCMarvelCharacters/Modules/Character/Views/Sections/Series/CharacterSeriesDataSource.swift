import UIKit

class CharacterSeriesDataSource: NSObject {
    let viewModel: CharacterSeriesViewModelProtocol
    
    init(viewModel: CharacterSeriesViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    func configure(_ collectionView: UICollectionView) {
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(SeriesCollectionViewCell.nib, forCellWithReuseIdentifier: SeriesCollectionViewCell.identifier)
    }
}

extension CharacterSeriesDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let series = viewModel.items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeriesCollectionViewCell.identifier, for: indexPath) as! SeriesCollectionViewCell
        cell.configure(series: series)
        return cell
    }
    
    
}
