import UIKit

class SeriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImage: UIImageView!
    func configure(series: Series) {
        if let url = series.thumbnail?.url {
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
