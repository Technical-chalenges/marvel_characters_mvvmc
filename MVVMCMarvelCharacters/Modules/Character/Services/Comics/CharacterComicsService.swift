class CharacterComicsService: MoyaService, CharacterComicsServiceProtocol {
    func fetchComics(characterId: Int, offset: Int, limit: Int, _ completion: @escaping (Result<[Comic], ServiceError>) -> Void) {
        fetch(.comics(chracterId: characterId, offset: offset, limit: limit), completion)
    }
}
