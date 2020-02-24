protocol PaginableVMP: BaseVMP {
    var paginableViewDelegate: PaginableViewDelegate? { get }
    
    associatedtype T
    var items: [T] { get }
    var pageSize: Int { get }
    var totalSize: Int? { get }
    var isLoading: Bool { get }
    
    func loadMoreItems(clear: Bool)
}
