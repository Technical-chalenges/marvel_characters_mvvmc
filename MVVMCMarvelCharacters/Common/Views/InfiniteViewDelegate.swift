import UIKit

class InfiniteViewDelegate: NSObject {
    enum Direction {
        case horisontal
        case vertical
    }
    typealias EndReachedClosureType = () -> Void
    typealias RowSelectedClosureType = (IndexPath) -> Void
    let direction: Direction
    var EndReachedClosure: EndReachedClosureType?
    var rowSelectedClosure : RowSelectedClosureType?
    let sensivity: CGFloat
    
    init(direction: Direction, sensivity: CGFloat = 1) {
        self.direction = direction
        self.sensivity = sensivity
    }
    
    func configure(tableView: UITableView) {
        tableView.delegate = self
    }
    
    func configure(collectionView: UICollectionView) {
        collectionView.delegate = self
    }
}

extension InfiniteViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelectedClosure?(indexPath)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView.isDragging else { return }
        switch direction {
        case .horisontal:
            let offsetX = scrollView.contentOffset.x
            let contentWidth = scrollView.contentSize.width
            if offsetX >= contentWidth - scrollView.frame.width * sensivity {
                EndReachedClosure?()
            }
        case .vertical:
            let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height
            if offsetY > contentHeight - scrollView.frame.height * sensivity {
                EndReachedClosure?()
            }
        }
    }
}

extension InfiniteViewDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        rowSelectedClosure?(indexPath)
    }
}

