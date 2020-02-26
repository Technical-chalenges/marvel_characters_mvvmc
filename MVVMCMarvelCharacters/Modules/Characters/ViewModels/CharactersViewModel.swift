class CharactersViewModel: PaginableViewModel<Character>, CharactersViewModelProtocol {
    weak var charactersCoordinatorDelegate: CharactersViewModelCoordinatorDelegate?
    let charactersService: CharactersServiceProtocol
    
    override var title: String {
        "Characters"
    }
    
    init(service: CharactersServiceProtocol) {
        self.charactersService = service
    }
    
    func loadCharacters() {
        loadMoreItems()
    }
    
    func reloadCharacters() {
        loadMoreItems(clear: true)
    }
    
    func showCharacter(index: Int) {
        let character = items[index]
        charactersCoordinatorDelegate?.didSelect(viewModel: self, character: character)
    }
    
    func addToFavorite(character: Character) {
        charactersService.addToFavorite(character: character, proccessFavorite)
    }
    
    func removeFromFavorite(character: Character) {
        charactersService.removeFromFavorite(character: character, proccessFavorite)
    }
    
    private func proccessFavorite(result: Result<Character, ServiceError>) -> Void {
        switch result {
        case .success(let character):
            guard let index = self.items.firstIndex(where: {$0.id == character.id }) else { return }
            self.items[index] = character
            self.viewDelegate?.refreshView()
        case .failure(let error):
            self.errorMessage = error.localizedDescription
        }
    }
    
    override func loadItems(offset: Int, limit: Int, _ completion: @escaping (Result<[Character], ServiceError>) -> Void) {
        charactersService.fetchCharacters(offset: offset, limit: limit, completion)
    }
}
