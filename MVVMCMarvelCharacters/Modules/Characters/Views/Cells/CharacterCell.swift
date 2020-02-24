import UIKit
import Kingfisher

class CharacterCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    var character: Character? {
        didSet {
            configure(character: character)
        }
    }
    
    var addToFavorite: ((Character) -> Void)?
    var removeFromFavorite: ((Character) -> Void)?
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        guard let character = character, let isFavorite = character.isFavorite else { return }
        if  isFavorite {
            removeFromFavorite?(character)
        } else {
            addToFavorite?(character)
        }
    }
    
    func configure(character: Character?) {
        guard let character = character else { return }
        thumbnail.byUrl(url: character.thumbnail?.url, placeholder: "character_placeholder")
        nameLabel.text = character.name
        descriptionLabel.text = character.description
        
        guard let isFavorite = character.isFavorite else { return }
        let favoriteButtonImage = isFavorite ? "favorited" : "unfavorited"
        favoriteButton.setImage(UIImage(named: favoriteButtonImage), for: .normal)
    }
}
