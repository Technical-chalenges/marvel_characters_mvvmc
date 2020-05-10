protocol CharactersViewModelProtocol: PaginableViewModel<Character> {
    var searchCharacterTitle: String? { get set}
    var charactersCoordinatorDelegate: CharactersViewModelCoordinatorDelegate? { get }
    var remoteCharactersStore: CharactersStore { get }
    func loadCharacters()
    func reloadCharacters()
    func showCharacter(index: Int)
    func addToFavorite(character: Character)
    func removeFromFavorite(character: Character)
    func isFavorite(_ character: Character) -> Bool
}
