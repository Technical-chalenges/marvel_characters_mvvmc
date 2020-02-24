import UIKit
import Kingfisher

class CharacterInfoCell: UITableViewCell {
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var comicsCountLabel: UILabel!
    @IBOutlet weak var seriesCountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var viewModel: CharacterInfoViewModelProtocol? {
        didSet {
            initByViewModel()
        }
    }
    
    private func initByViewModel() {
        guard let viewModel = viewModel else { return }
        thumbnailImage.byUrl(url: viewModel.thumbnail?.url, placeholder: "character_placeholder")
        nameLabel.text = viewModel.name
        comicsCountLabel.text = String(viewModel.totalComics)
        seriesCountLabel.text = String(viewModel.totalSeries)
        descriptionLabel.text = viewModel.description
    }
}
