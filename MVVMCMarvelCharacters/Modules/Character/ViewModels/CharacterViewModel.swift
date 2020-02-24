class CharacterViewModel: BaseViewModel, CharacterViewModelProtocol {
    var character: Character
    var name: String? {
        character.name
    }
    
    var sections: [CharacterRepresentable]
    
    init(character: Character, comicsService: ComicsServiceProtocol, seriesService: SeriesServiceProtocol) {
        self.character = character
        
        let characterComicsViewModel = CharacterComicsViewModel(character: character)
        characterComicsViewModel.service = comicsService
        
        let characterSeriesViewModel = CharacterSeriesViewModel(character: character)
        characterSeriesViewModel.service = seriesService
        
        sections = [CharacterRepresentable]()
        sections.append(CharacterInfoViewModel(character: character))
        sections.append(characterComicsViewModel)
        sections.append(characterSeriesViewModel)
    }
}
