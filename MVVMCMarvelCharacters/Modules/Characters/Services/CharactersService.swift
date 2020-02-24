import Moya

class CharactersService: MoyaService, CharactersServiceProtocol {
    func fetchCharacters(offset: Int, limit: Int, _ completion: @escaping (Result<[Character], ServiceError>) -> Void) {
        fetch(.characters(offset: offset, limit: limit), completion)
    }
}
