import UIKit

class CharacterSeriesCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: CharacterSeriesViewModelProtocol? {
        didSet {
            initByViewModel()
        }
    }
    
    private var seriesDataSource: CharacterSeriesDataSource!
    private var tableViewDelegate: InfiniteCollectionViewDelegate!
    
    private func initByViewModel() {
        guard var viewModel = viewModel else { return }
        viewModel.viewDelegate = self
        seriesDataSource = CharacterSeriesDataSource(viewModel: viewModel)
        seriesDataSource.configure(collectionView)
        tableViewDelegate = InfiniteCollectionViewDelegate(direction: .horisontal, sensivity: 3)
        tableViewDelegate.EndReachedClosure = viewModel.loadSeries
        tableViewDelegate.configure(collectionView: collectionView)
        viewModel.loadSeries()
    }
}

extension CharacterSeriesCell: ViewDelegate {
    func refreshView() {
        collectionView.reloadData()
    }
    
    func errorMessageChanged() {
    }
}
