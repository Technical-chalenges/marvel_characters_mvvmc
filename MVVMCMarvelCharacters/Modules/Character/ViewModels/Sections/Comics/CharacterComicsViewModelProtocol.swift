protocol CharacterComicsViewModelProtocol: BaseViewModelProtocol, CharacterSectionProtocol {
    var service: CharacterComicsServiceProtocol? { get }
    var items: [Comic] { get }
    func loadComics()
}
