protocol CharacterComicsVMP: CharacterRepresentable {
    var viewDelegate: PaginableViewDelegate? { get set }
    var service: ComicsServiceP? { get }
    var items: [Comic] { get }
    func loadComics()
}
