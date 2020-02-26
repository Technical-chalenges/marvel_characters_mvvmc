import UIKit

class LoadingCell: UITableViewCell {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.autoresizingMask = .flexibleHeight
    }
}
