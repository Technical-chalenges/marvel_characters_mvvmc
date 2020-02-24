class CharacterSeriesViewModel: PaginableViewModel<Series>, CharacterSeriesViewModelProtocol {
    var sectionType = CharacterSectionType.series
    var character: Character
    var service: CharacterSeriesServiceProtocol?
    var sectionTitle: String? {
        "series"
    }
    
    init(character: Character) {
        self.character = character
        super.init()
        self.totalSize = character.series?.available
    }
    
    func loadSeries() {
        loadMoreItems(clear: false)
    }
    
    override func loadItems(offset: Int, limit: Int, _ completion: @escaping (Result<[Series], ServiceError>) -> Void) {
        service?.fetchSeries(characterId: character.id, offset: offset, limit: limit, completion)
    }
}
