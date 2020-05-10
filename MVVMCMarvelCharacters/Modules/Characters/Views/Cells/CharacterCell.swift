import UIKit

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
    
    var addToFavorite: ((Character) -> Void)!
    var removeFromFavorite: ((Character) -> Void)!
    var isFavorite: ((Character) -> Bool)!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        self.contentView.autoresizingMask = .flexibleHeight
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        guard let character = character else { return }
        if  isFavorite(character) {
            removeFromFavorite(character)
        } else {
            addToFavorite(character)
        }
    }
    
    func configure(character: Character?) {
        guard let character = character else { return }
        thumbnail.byUrl(url: character.thumbnail?.url, placeholder: R.image.character_placeholder())
        nameLabel.text = character.name
        descriptionLabel.text = character.description
        
        let favoriteButtonImage = isFavorite(character) ? R.image.favorited() : R.image.unfavorited()
        favoriteButton.setImage(favoriteButtonImage, for: .normal)
    }
}
