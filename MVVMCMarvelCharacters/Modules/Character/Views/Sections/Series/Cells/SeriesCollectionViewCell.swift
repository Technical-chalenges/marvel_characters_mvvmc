import UIKit

class SeriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImage: UIImageView!
    func configure(series: Series) {
        thumbnailImage.byUrl(url: series.thumbnail?.url, placeholder: R.image.character_placeholder())
    }
}
