import Combine

class CharacterViewModel: BaseViewModel, CharacterViewModelProtocol {
    weak var characterCoordinatorDelegate: CharacterViewModelCoordinatorDelegate?
    let charactersService: CharactersStore
    let comicsService: CharacterComicsServiceProtocol
    let seriesService: CharacterSeriesServiceProtocol
    let favorites: Favorites
    var character: Character {
        didSet {
            updateViewModel()
            viewDelegate?.refreshView()
        }
    }
    
    var name: String? {
        character.name
    }
    
    var sections: [CharacterSectionProtocol]
    var favoriteChangedToken: AnyCancellable?
    
    init(
        character: Character,
        charactersService: CharactersStore,
        comicsService: CharacterComicsServiceProtocol,
        seriesService: CharacterSeriesServiceProtocol,
        favorites: Favorites = Favorites()) {
        self.charactersService = charactersService
        self.comicsService = comicsService
        self.seriesService = seriesService
        self.sections = [CharacterSectionProtocol]()
        self.character = character
        self.favorites = favorites
        super.init()
        self.updateViewModel()
        favoriteChangedToken = favorites.objectWillChange.sink { [unowned self] _ in
            self.viewDelegate?.refreshView()
        }
    }
    
    func updateViewModel() {
        sections.removeAll()
        sections.append(CharacterInfoViewModel(character: character))
        
        if let comicsCount = character.comics?.available, comicsCount > 0 {
            let characterComicsViewModel = CharacterComicsViewModel(character: character)
            characterComicsViewModel.service = comicsService
            sections.append(characterComicsViewModel)
        }
        
        if let seriesCount = character.series?.available, seriesCount > 0 {
            let characterSeriesViewModel = CharacterSeriesViewModel(character: character)
            characterSeriesViewModel.service = seriesService
            sections.append(characterSeriesViewModel)
        }
    }
    
    func addToFavorite() {
        favorites.add(character)
    }
    
    func removeFromFavorite() {
        favorites.remove(character)
    }
    
    func isFavorite() -> Bool {
        return favorites.contains(character)
    }
    
    private func proccessFavorite(result: Result<Character, ServiceError>) -> Void {
        switch result {
        case .success(let character):
            self.character = character
            viewDelegate?.refreshView()
        case .failure(let error):
            self.errorMessage = error.localizedDescription
        }
    }
}
