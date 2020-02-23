protocol ComicsServiceP {
    func fetchComics(characterId: Int, offset: Int, limit: Int, _ completion: @escaping (Result<[Comic], ServiceError>) -> Void)
}
