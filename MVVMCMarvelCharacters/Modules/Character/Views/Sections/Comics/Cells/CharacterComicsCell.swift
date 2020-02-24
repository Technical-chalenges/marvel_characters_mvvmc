import UIKit

class CharacterComicsCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: CharacterComicsViewModelProtocol? {
        didSet {
            initByViewModel()
        }
    }
    
    var comicsDataSource: CharacterComicsDataSource!
    var tableViewDelegate: InfiniteCollectionViewDelegate!
    
    private func initByViewModel() {
        guard var viewModel = viewModel else { return }
        viewModel.viewDelegate = self
        comicsDataSource = CharacterComicsDataSource(viewModel: viewModel)
        comicsDataSource.configure(collectionView)
        tableViewDelegate = InfiniteCollectionViewDelegate(direction: .horisontal, sensivity: 3)
        tableViewDelegate.EndReachedClosure = viewModel.loadComics
        tableViewDelegate.configure(collectionView: collectionView)
        viewModel.loadComics()
    }
}

extension CharacterComicsCell: ViewDelegate {
    func refreshView() {
        collectionView.reloadData()
    }
    
    func errorMessageChanged() {
    }
}
