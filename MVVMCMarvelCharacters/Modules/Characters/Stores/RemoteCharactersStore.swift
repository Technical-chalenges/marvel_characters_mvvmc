import Moya

class RemoteCharactersStore: MoyaService<API>, CharactersStore {
    func fetchCharacters(by name: String?, offset: Int, limit: Int, _ completion: @escaping (Result<[Character], ServiceError>) -> Void) {
        fetch(.characters(nameStartsWith: name, offset: offset, limit: limit), completion)
    }
    
    func addToFavorite(character: Character, _ completion: @escaping (Result<Character, ServiceError>) -> Void) {
        // у api марвела нет добавления в избранное
    }
    
    func removeFromFavorite(character: Character, _ completion: @escaping (Result<Character, ServiceError>) -> Void) {
        // у api марвела нет удления из избранного
    }
}
