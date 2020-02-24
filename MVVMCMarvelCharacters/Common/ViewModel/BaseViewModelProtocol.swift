protocol BaseViewModelProtocol {
    var viewDelegate: ViewDelegate? { get set }
    var title: String { get }
    var errorMessage: String? { get }
}
