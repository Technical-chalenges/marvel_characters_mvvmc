protocol BaseViewModelProtocol {
    var viewDelegate: ViewDelegate? { get }
    var title: String { get }
    var errorMessage: String? { get }
}
