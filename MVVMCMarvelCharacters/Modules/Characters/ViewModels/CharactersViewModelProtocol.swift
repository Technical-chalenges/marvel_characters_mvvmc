protocol CharactersViewModelProtocol: PaginableViewModel<Character> {
    var charactersCoordinatorDelegate: CharactersViewModelCoordinatorDelegate? { get }
    var charactersService: CharactersServiceProtocol { get }
    func loadCharacters()
    func reloadCharacters()
    func showCharacter(index: Int)
    func addToFavorite(character: Character)
    func removeFromFavorite(character: Character)
}
