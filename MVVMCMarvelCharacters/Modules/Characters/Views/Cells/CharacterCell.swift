import UIKit
import Kingfisher

class CharacterCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configure(character: Character) {
        if let url = character.thumbnail?.url {
            thumbnail.kf.indicatorType = .activity
            thumbnail.kf.setImage(
                with: url,
                placeholder: UIImage(named: "character_placeholder"),
                options: [.transition(.fade(0.3))])
        } else {
            thumbnail.image = UIImage(named: "character_placeholder")
        }
        nameLabel.text = character.name
        descriptionLabel.text = character.description
    }
}
