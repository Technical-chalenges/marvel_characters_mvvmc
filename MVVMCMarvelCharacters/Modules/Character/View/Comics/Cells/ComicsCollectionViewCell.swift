import UIKit

class ComicsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImage: UIImageView!
    func configure(comic: Comic) {
        if let url = comic.thumbnail?.url {
            thumbnailImage.kf.indicatorType = .activity
            thumbnailImage.kf.setImage(
                with: url,
                placeholder: UIImage(named: "character_placeholder"),
                options: [.transition(.fade(0.3))])
        } else {
            thumbnailImage.image = UIImage(named: "character_placeholder")
        }
    }
}
