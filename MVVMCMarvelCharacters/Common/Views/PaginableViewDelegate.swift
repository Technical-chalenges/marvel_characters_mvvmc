protocol PaginableViewDelegate: AnyObject {
    func loadStarted()
    func loadEnded()
    func itemsDidChanged()
}
