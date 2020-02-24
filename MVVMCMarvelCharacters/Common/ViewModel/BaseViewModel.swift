class BaseViewModel: BaseViewModelProtocol {
    var viewDelegate: ViewDelegate?
    var title: String {
        ""
    }
    var errorMessage: String? {
        didSet {
            viewDelegate?.errorMessageChanged()
        }
    }
}
