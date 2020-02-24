protocol CharacterComicsVMP: CharacterRepresentable {
    var paginableViewDelegate: PaginableViewDelegate? { get set }
    var service: ComicsServiceP? { get }
    var items: [Comic] { get }
    func loadComics()
}
