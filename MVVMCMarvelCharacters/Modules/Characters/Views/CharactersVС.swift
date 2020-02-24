import UIKit

class CharactersVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: CharactersVMP
    var tableViewDataSource: CharactersDataSource
    var tableViewDelegate: InfiniteViewDelegate!
    private var refreshControl = UIRefreshControl()
    
    init(viewModel: CharactersVMP) {
        self.viewModel = viewModel
        tableViewDataSource = CharactersDataSource(viewModel: viewModel)
        tableViewDelegate = InfiniteViewDelegate(direction: .vertical, sensivity: 0.8)
        super.init(nibName: "CharacterVC", bundle: nil)
        
        self.title = viewModel.title
        tableViewDelegate.EndReachedClosure = viewModel.loadCharacters
        tableViewDelegate.rowSelectedClosure = showCharacter
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.addTarget(self, action: #selector(refreshCharacters(_:)), for: .valueChanged)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        
        tableViewDataSource.configure(tableView: tableView)
        tableViewDelegate.configure(tableView: tableView)
    }
    
    func showCharacter(indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.showCharacter(index: indexPath.row)
    }
    
    @objc private func refreshCharacters(_ sender: Any) {
        viewModel.reloadCharacters()
    }
}

extension CharactersVC: PaginableViewDelegate {
    func itemsDidLoad() {
        refreshControl.endRefreshing()
        tableView.reloadData()
    }
}
