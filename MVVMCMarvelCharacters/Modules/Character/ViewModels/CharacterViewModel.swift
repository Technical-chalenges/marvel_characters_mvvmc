class CharacterViewModel: BaseViewModel, CharacterViewModelProtocol {
    var character: Character
    var name: String? {
        character.name
    }
    
    var sections: [CharacterRepresentable]
    
    init(character: Character, comicsService: ComicsServiceProtocol, seriesService: SeriesServiceProtocol) {
        self.character = character
        
        sections = [CharacterRepresentable]()
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
}
