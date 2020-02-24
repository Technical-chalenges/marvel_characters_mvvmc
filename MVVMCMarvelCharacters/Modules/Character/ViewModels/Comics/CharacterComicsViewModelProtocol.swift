protocol CharacterComicsViewModelProtocol: CharacterRepresentable {
    var paginableViewDelegate: PaginableViewDelegate? { get set }
    var service: ComicsServiceProtocol? { get }
    var items: [Comic] { get }
    func loadComics()
}
