protocol CharactersServiceProtocol {
    func fetchCharacters(offset: Int, limit: Int, _ completion: @escaping (Result<[Character], ServiceError>) -> Void)
}
