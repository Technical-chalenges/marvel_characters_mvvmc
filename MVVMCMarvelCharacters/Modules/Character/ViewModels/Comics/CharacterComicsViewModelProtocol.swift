protocol CharacterComicsViewModelProtocol: BaseViewModelProtocol, CharacterRepresentable {
    var service: ComicsServiceProtocol? { get }
    var items: [Comic] { get }
    func loadComics()
}
