class CharacterVM: CharacterVMP {
    var character: Character
    weak var coordinatorDelegate: CharacterCoordinatorViewModelDelegate?
    var name: String? {
        character.name
    }
    
    var sections: [CharacterRepresentable]
    
    init(character: Character, comicsService: ComicsServiceP, seriesService: SeriesServiceP) {
        self.character = character
        
        let characterComicsViewModel = CharacterComicsVM(character: character)
        characterComicsViewModel.service = comicsService
        
        let characterSeriesViewModel = CharacterSeriesVM(character: character)
        characterSeriesViewModel.service = seriesService
        
        sections = [CharacterRepresentable]()
        sections.append(CharacterInfoVM(character: character))
        sections.append(characterComicsViewModel)
        sections.append(characterSeriesViewModel)
    }
    
    func didFinish() {
        coordinatorDelegate?.didFinish()
    }
}
