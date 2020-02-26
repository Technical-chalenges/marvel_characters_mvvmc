import UIKit
import Kingfisher

extension UIImageView {
    func byUrl(url: URL?, placeholder: UIImage?) {
        if let url = url {
            self.kf.indicatorType = .activity
            self.kf.setImage(
                with: url,
                placeholder: placeholder,
                options: [
                    .processor(DownsamplingImageProcessor(size: self.frame.size)),
                    .scaleFactor(UIScreen.main.scale),
                    .cacheOriginalImage,
                    .transition(.fade(0.3))])
        }
    }
}
