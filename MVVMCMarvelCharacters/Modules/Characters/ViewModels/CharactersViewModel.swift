import Dispatch
import Combine

class CharactersViewModel: PaginableViewModel<Character>, CharactersViewModelProtocol {
    weak var charactersCoordinatorDelegate: CharactersViewModelCoordinatorDelegate?
    let remoteCharactersStore: CharactersStore
    let favorites: Favorites
    var searchingWorkItem: DispatchWorkItem?
    
    override var title: String {
        "Characters"
    }
    
    var searchCharacterTitle: String? {
        willSet {
            guard searchCharacterTitle != newValue else { return }
            searchingWorkItem?.cancel()

            let currentWorkItem = DispatchWorkItem { [unowned self] in
                self.reloadCharacters()
            }

            var delay = 0.2
            if let
                searchCharacterTitle = searchCharacterTitle,
                searchCharacterTitle.isEmpty {
                delay = 0
            }
            searchingWorkItem = currentWorkItem
            DispatchQueue.main.asyncAfter(
                deadline: .now() + delay,
                execute: currentWorkItem)
        }
    }
    
    private var favoriteToken: AnyCancellable?
    
    init(service: CharactersStore, favorites: Favorites = Favorites()) {
        self.remoteCharactersStore = service
        self.favorites = favorites
        super.init()
        favoriteToken = favorites.objectWillChange.sink { [unowned self] _ in
            self.viewDelegate?.refreshView()
        }
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
    
    func isFavorite(_ character: Character) -> Bool {
        return favorites.contains(character)
    }
    
    func addToFavorite(character: Character) {
        favorites.add(character)
    }
    
    func removeFromFavorite(character: Character) {
        favorites.remove(character)
    }
    
    override func loadItems(offset: Int, limit: Int, _ completion: @escaping (Result<[Character], ServiceError>) -> Void) {
        remoteCharactersStore.fetchCharacters(by: searchCharacterTitle, offset: offset, limit: limit, completion)
    }
}
