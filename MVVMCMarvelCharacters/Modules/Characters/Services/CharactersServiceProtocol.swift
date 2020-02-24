protocol CharactersServiceProtocol {
    func fetchCharacters(offset: Int, limit: Int, _ completion: @escaping (Result<[Character], ServiceError>) -> Void)
    func addToFavorite(character: Character, _ completion: @escaping (Result<Character, ServiceError>) -> Void)
    func removeFromFavorite(character: Character, _ completion: @escaping (Result<Character, ServiceError>) -> Void)
}
