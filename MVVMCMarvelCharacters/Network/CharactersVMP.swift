protocol CharactersVMP: BaseVMP {
    var service: CharactersSP { get }
    var items: [Character] { get }
    func loadCharacters()
    func reloadCharacters()
    func showCharacter(index: Int)
}
