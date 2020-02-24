class CharacterViewModel: BaseViewModel, CharacterViewModelProtocol {
    weak var characterCoordinatorDelegate: CharacterViewModelCoordinatorDelegate?
    var charactersService: CharactersServiceProtocol
    var comicsService: CharacterComicsServiceProtocol
    var seriesService: CharacterSeriesServiceProtocol
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
    
    init(
        character: Character,
        charactersService: CharactersServiceProtocol,
        comicsService: CharacterComicsServiceProtocol,
        seriesService: CharacterSeriesServiceProtocol) {
        self.charactersService = charactersService
        self.comicsService = comicsService
        self.seriesService = seriesService
        self.sections = [CharacterSectionProtocol]()
        self.character = character
        super.init()
        self.updateViewModel()
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
        charactersService.addToFavorite(character: character, proccessFavorite)
    }
    
    func removeFromFavorite() {
        charactersService.removeFromFavorite(character: character, proccessFavorite)
    }
    
    private func proccessFavorite(result: Result<Character, ServiceError>) -> Void {
        switch result {
        case .success(let character):
            self.character = character
            viewDelegate?.refreshView()
            characterCoordinatorDelegate?.characterStateChanged(character: character)
        case .failure(let error):
            self.errorMessage = error.localizedDescription
        }
    }
}
