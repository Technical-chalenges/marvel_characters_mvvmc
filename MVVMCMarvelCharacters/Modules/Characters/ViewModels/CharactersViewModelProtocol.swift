protocol CharactersViewModelProtocol: PaginableViewModel<Character> {
    var searchCharacterTitle: String? { get set}
    var charactersCoordinatorDelegate: CharactersViewModelCoordinatorDelegate? { get }
    var charactersService: CharactersServiceProtocol { get }
    func loadCharacters()
    func reloadCharacters()
    func showCharacter(index: Int)
    func addToFavorite(character: Character)
    func removeFromFavorite(character: Character)
}
