protocol CharacterViewModelProtocol: BaseViewModelProtocol {
    var characterCoordinatorDelegate: CharacterViewModelCoordinatorDelegate? { get }
    var charactersService: CharactersServiceProtocol { get }
    var character: Character { get }
    var name: String? { get }
    var sections: [CharacterSectionProtocol] { get }
    func addToFavorite()
    func removeFromFavorite()
}
