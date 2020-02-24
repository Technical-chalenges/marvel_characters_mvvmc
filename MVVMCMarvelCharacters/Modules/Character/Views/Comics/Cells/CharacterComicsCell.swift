import UIKit

class CharacterComicsCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: CharacterComicsViewModelProtocol!
    var comicsDataSource: ComicsDataSource!
    var tableViewDelegate: InfiniteViewDelegate!
    func configure(vm: CharacterComicsViewModelProtocol) {
        viewModel = vm
        viewModel.viewDelegate = self
        initByViewModel()
    }
    
    private func initByViewModel() {
        comicsDataSource = ComicsDataSource(viewModel: viewModel)
        comicsDataSource.configure(collectionView)
        
        tableViewDelegate = InfiniteViewDelegate(direction: .horisontal, sensivity: 3)
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
