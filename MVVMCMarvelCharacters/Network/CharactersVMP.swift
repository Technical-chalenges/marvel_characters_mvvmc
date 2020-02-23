protocol CharactersVMP: BaseVMP {
    var service: CharactersSP { get }
    var coordinatorDelegate: CharactersViewModelCoordinatorDelegate? { get }
    var items: [Character] { get }
    func loadCharacters()
    func reloadCharacters()
    func showCharacter(index: Int)
    func didFinish()
}
