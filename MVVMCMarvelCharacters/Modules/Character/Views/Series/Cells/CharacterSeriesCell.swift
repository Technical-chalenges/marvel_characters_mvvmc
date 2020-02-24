import UIKit

class CharacterSeriesCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: CharacterSeriesViewModelProtocol!
    var seriesDataSource: SeriesDataSource!
    var tableViewDelegate: InfiniteViewDelegate!
    func configure(vm: CharacterSeriesViewModelProtocol) {
        viewModel = vm
        viewModel.viewDelegate = self
        initByViewModel()
    }
    
    private func initByViewModel() {
        seriesDataSource = SeriesDataSource(viewModel: viewModel)
        seriesDataSource.configure(collectionView)
        
        tableViewDelegate = InfiniteViewDelegate(direction: .horisontal, sensivity: 3)
        tableViewDelegate.EndReachedClosure = viewModel.loadSeries
        tableViewDelegate.configure(collectionView: collectionView)
        viewModel.loadSeries()
    }
}

extension CharacterSeriesCell: ViewDelegate {
    func errorMessageChanged() {
    }
    
    func refreshView() {
        collectionView.reloadData()
    }
}
