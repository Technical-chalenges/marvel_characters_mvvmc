import UIKit

class CharactersVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var viewModel: CharactersViewModelProtocol
    private var tableViewDataSource: CharactersDataSource
    private var tableViewDelegate: InfiniteCollectionViewDelegate
    private var refreshControl: UIRefreshControl
    private var searchController: UISearchController
    
    init(viewModel: CharactersViewModelProtocol) {
        self.viewModel = viewModel
        tableViewDataSource = CharactersDataSource(viewModel: viewModel)
        tableViewDelegate = InfiniteCollectionViewDelegate(direction: .vertical, sensivity: 1)
        refreshControl = UIRefreshControl()
        searchController = UISearchController(searchResultsController: nil)
        super.init(nibName: "CharacterVC", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        
        refreshControl.addTarget(self, action: #selector(refreshCharacters(_:)), for: .valueChanged)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        
        tableViewDataSource.configure(tableView: tableView)
        tableViewDelegate.configure(tableView: tableView)
        
        tableViewDelegate.EndReachedClosure = viewModel.loadCharacters
        tableViewDelegate.rowSelectedClosure = showCharacter

        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "имя героя"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        viewModel.loadCharacters()
    }
    
    func showCharacter(indexPath: IndexPath) {
        viewModel.showCharacter(index: indexPath.row)
    }
    
    @objc func refreshCharacters(_ sender: Any) {
        viewModel.reloadCharacters()
    }
}

extension CharactersVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text {
            viewModel.searchCharacterTitle = text
        }
    }
}

extension CharactersVC: PaginableViewDelegate {
    func loadStarted() {
        tableView.reloadSections(IndexSet.init(integer: CharactersDataSource.loadingSectionIndex), with: .automatic)
    }
    
    func loadEnded() {
        refreshControl.endRefreshing()
    }
}

extension CharactersVC: ViewDelegate {
    func refreshView() {
        tableView.reloadData()
    }
    
    func errorMessageChanged() {
        guard let errorMessage = viewModel.errorMessage else { return }
        showAlert("", message: errorMessage)
    }
}
