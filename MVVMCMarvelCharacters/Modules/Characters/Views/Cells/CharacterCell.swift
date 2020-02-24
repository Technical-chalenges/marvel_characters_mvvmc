import UIKit
import Kingfisher

class CharacterCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(character: Character) {
        thumbnail.byUrl(url: character.thumbnail?.url, placeholder: "character_placeholder")
        nameLabel.text = character.name
        descriptionLabel.text = character.description
    }
}
