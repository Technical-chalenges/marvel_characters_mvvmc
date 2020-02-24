import UIKit
import Kingfisher

class CharacterInfoCell: UITableViewCell {
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var comicsCountLabel: UILabel!
    @IBOutlet weak var seriesCountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    func configure(vm: CharacterInfoViewModelProtocol) {
        thumbnailImage.byUrl(url: vm.thumbnail?.url, placeholder: "character_placeholder")
        nameLabel.text = vm.name
        comicsCountLabel.text = String(vm.totalComics)
        seriesCountLabel.text = String(vm.totalSeries)
        descriptionLabel.text = vm.description
    }
    
}
