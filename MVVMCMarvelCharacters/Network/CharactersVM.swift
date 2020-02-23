class CharactersVM: PaginableVM<Character>, CharactersVMP {
    var service: CharactersSP
    weak var coordinatorDelegate: CharactersViewModelCoordinatorDelegate?
    
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
    
    func didFinish() {
        coordinatorDelegate?.didFinish(viewModel: self)
    }
    
    override func loadItems(offset: Int, limit: Int, _ completion: @escaping (Result<[Character], ServiceError>) -> Void) {
        service.fetchCharacters(offset: offset, limit: limit, completion)
    }
}
