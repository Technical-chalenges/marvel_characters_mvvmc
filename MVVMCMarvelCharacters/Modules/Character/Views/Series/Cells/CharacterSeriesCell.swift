import UIKit

class CharacterSeriesCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: CharacterSeriesViewModelProtocol!
    var seriesDataSource: SeriesDataSource!
    var tableViewDelegate: InfiniteViewDelegate!
    func configure(vm: CharacterSeriesViewModelProtocol) {
        viewModel = vm
        viewModel.paginableViewDelegate = self
        initByViewModel()
    }
    
    private func initByViewModel() {
        seriesDataSource = SeriesDataSource(viewModel: viewModel)
        seriesDataSource.configure(collectionView)
        
        tableViewDelegate = InfiniteViewDelegate(direction: .horisontal, sensivity: 0.8)
        tableViewDelegate.EndReachedClosure = viewModel.loadSeries
        tableViewDelegate.configure(collectionView: collectionView)
        viewModel.loadSeries()
    }
}

extension CharacterSeriesCell: PaginableViewDelegate {
    func itemsDidLoad() {
        collectionView.reloadData()
    }
}
