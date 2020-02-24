class CharacterComicsViewModel: PaginableViewModel<Comic>, CharacterComicsViewModelProtocol {
    var sectionType = CharacterSectionType.comics
    var character: Character
    var service: ComicsServiceProtocol?
    var sectionTitle: String? {
        "comics"
    }
    
    init(character: Character) {
        self.character = character
        super.init()
        self.totalSize = character.comics?.available
    }
    
    func loadComics() {
        loadMoreItems(clear: false)
    }
    
    override func loadItems(offset: Int, limit: Int, _ completion: @escaping (Result<[Comic], ServiceError>) -> Void) {
        service?.fetchComics(characterId: character.id, offset: offset, limit: limit, completion)
    }
}
