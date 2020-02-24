class CharactersVM: PaginableVM<Character>, CharactersVMP {
    weak var coordinatorDelegate: CharactersViewModelCoordinatorDelegate?
    var service: CharactersSP
    
    override var title: String {
        "Characters"
    }
    
    init(service: CharactersSP) {
        self.service = service
    }
    
    func loadCharacters() {
        loadMoreItems()
    }
    
    func reloadCharacters() {
        loadMoreItems(clear: true)
    }
    
    func showCharacter(index: Int) {
        let character = items[index]
        coordinatorDelegate?.didSelect(viewModel: self, character: character)
    }
    
    override func loadItems(offset: Int, limit: Int, _ completion: @escaping (Result<[Character], ServiceError>) -> Void) {
        service.fetchCharacters(offset: offset, limit: limit, completion)
    }
}
