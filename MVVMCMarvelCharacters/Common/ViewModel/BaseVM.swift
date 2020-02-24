class BaseVM: BaseVMP {
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
