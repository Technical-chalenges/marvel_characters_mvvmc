import UIKit
import CoreGraphics

class CharacterVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let viewModel: CharacterViewModelProtocol
    private let dataSource: CharacterDataSource
    private let favoriteButton: UIButton
    private let rightBarButton: UIBarButtonItem
    
    init(viewModel: CharacterViewModelProtocol) {
        self.viewModel = viewModel
        self.dataSource = CharacterDataSource(viewModel: viewModel)
        
        favoriteButton = UIButton(type: .custom)
        favoriteButton.frame = CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0)
        rightBarButton = UIBarButtonItem(customView: favoriteButton)
        super.init(nibName: "CharacterVC", bundle: nil)
        self.title = viewModel.name
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = rightBarButton
        initFavoriteButton();
        
        dataSource.configure(tableView)
        tableView.reloadData()
    }
    
    private func initFavoriteButton() {
        let favoriteButtonImage = viewModel.character.isFavorite! ? "favorited" : "unfavorited"
        if let image = UIImage(named: favoriteButtonImage) {
            favoriteButton.setImage(image, for: .normal)
        }
    }
    
    @objc private func favoriteButtonTapped(sender: UIButton) {
        guard let isFavorite = viewModel.character.isFavorite else { return }
        if isFavorite {
            viewModel.removeFromFavorite()
        } else {
            viewModel.addToFavorite()
        }
    }
}

extension CharacterVC: ViewDelegate {
    func refreshView() {
        initFavoriteButton()
    }
    
    func errorMessageChanged() {
        guard let errorMessage = viewModel.errorMessage else { return }
        showAlert("", message: errorMessage)
    }
    
    
}
