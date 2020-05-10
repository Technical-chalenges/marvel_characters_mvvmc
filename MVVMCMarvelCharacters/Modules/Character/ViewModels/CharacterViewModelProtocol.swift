protocol CharacterViewModelProtocol: BaseViewModelProtocol {
    var characterCoordinatorDelegate: CharacterViewModelCoordinatorDelegate? { get }
    var charactersService: CharactersStore { get }
    var character: Character { get }
    var name: String? { get }
    var sections: [CharacterSectionProtocol] { get }
    func addToFavorite()
    func removeFromFavorite()
    func isFavorite() -> Bool
}
