class BaseVM: BaseVMP {
    var title: String {
        ""
    }
    var errorMessage: String? {
        didSet {
            // viewDelegate?.errorMessageChanged()
        }
    }
}
