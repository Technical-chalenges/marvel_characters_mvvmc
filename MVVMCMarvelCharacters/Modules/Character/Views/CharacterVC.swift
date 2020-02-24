import UIKit
import CoreGraphics

class CharacterVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel: CharacterViewModelProtocol
    let dataSource: CharacterDataSource
    var favoriteButton: UIButton!
    
    init(viewModel: CharacterViewModelProtocol) {
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
        
        favoriteButton = UIButton(type: .custom)
        favoriteButton.frame = CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0)
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: favoriteButton)
        navigationItem.rightBarButtonItem = barButton
        initFavoriteButton();
    }
    
    private func initFavoriteButton() {
        let favoriteButtonImage = viewModel.character.isFavorite! ? "favorited" : "unfavorited"
        if let image = UIImage(named: favoriteButtonImage) {
            favoriteButton.setImage(image, for: .normal)
        }
    }
    
    @objc func favoriteButtonTapped(sender: UIButton) {
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
    }
    
    
}
