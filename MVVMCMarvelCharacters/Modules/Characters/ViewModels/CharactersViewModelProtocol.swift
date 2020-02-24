protocol CharactersViewModelProtocol: BaseViewModelProtocol {
    var coordinatorDelegate: CharactersViewModelCoordinatorDelegate? { get }
    var service: CharactersServiceProtocol { get }
    var items: [Character] { get }
    func loadCharacters()
    func reloadCharacters()
    func showCharacter(index: Int)
}
