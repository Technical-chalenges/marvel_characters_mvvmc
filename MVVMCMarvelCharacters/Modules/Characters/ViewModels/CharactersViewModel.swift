import Dispatch

class CharactersViewModel: PaginableViewModel<Character>, CharactersViewModelProtocol {
    weak var charactersCoordinatorDelegate: CharactersViewModelCoordinatorDelegate?
    let charactersService: CharactersServiceProtocol
    var searchingWorkItem: DispatchWorkItem?
    var searchCharacterTitle: String? {
        didSet {
            searchingWorkItem?.cancel()
            let currentWorkItem = DispatchWorkItem { [unowned self] in
                self.reloadCharacters()
            }

            var delay = 0.2
            if let searchCharacterTitle = searchCharacterTitle, searchCharacterTitle.isEmpty {
                delay = 0
            }
            searchingWorkItem = currentWorkItem
            DispatchQueue.main.asyncAfter(deadline: .now() + delay,
                                          execute: currentWorkItem)
        }
    }
    
    
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
        charactersService.fetchCharacters(by: searchCharacterTitle, offset: offset, limit: limit, completion)
    }
}
