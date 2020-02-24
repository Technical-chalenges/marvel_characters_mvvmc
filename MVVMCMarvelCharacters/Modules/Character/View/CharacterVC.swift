import UIKit

class CharacterVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel: CharacterVMP
    let dataSource: CharacterDataSource
    
    init(viewModel: CharacterVMP) {
        self.viewModel = viewModel
        self.dataSource = CharacterDataSource(viewModel: viewModel)
        super.init(nibName: "CharacterVC", bundle: nil)
        self.title = viewModel.name
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.configure(tableView)
        tableView.reloadData()
    }
}
