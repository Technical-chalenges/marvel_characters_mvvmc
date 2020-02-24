import UIKit

class CharacterComicsCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: CharacterComicsVMP!
    var comicsDataSource: ComicsDataSource!
    var tableViewDelegate: InfiniteViewDelegate!
    func configure(vm: CharacterComicsVMP) {
        viewModel = vm
        viewModel.paginableViewDelegate = self
        initByViewModel()
    }
    
    private func initByViewModel() {
        comicsDataSource = ComicsDataSource(viewModel: viewModel)
        comicsDataSource.configure(collectionView)
        
        tableViewDelegate = InfiniteViewDelegate(direction: .horisontal, sensivity: 0.8)
        tableViewDelegate.EndReachedClosure = viewModel.loadComics
        tableViewDelegate.configure(collectionView: collectionView)
        viewModel.loadComics()
    }
}

extension CharacterComicsCell: PaginableViewDelegate {
    func itemsDidLoad() {
        collectionView.reloadData()
    }
}
