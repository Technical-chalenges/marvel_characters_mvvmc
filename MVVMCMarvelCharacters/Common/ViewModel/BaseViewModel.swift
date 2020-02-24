class BaseViewModel: BaseViewModelProtocol {
    weak var viewDelegate: ViewDelegate?
    var title: String {
        ""
    }
    var errorMessage: String? {
        didSet {
            viewDelegate?.errorMessageChanged()
        }
    }
}
