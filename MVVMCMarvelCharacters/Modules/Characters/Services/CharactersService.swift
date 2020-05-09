import Moya

class CharactersService: MoyaService<API>, CharactersServiceProtocol {
    func fetchCharacters(by name: String?, offset: Int, limit: Int, _ completion: @escaping (Result<[Character], ServiceError>) -> Void) {
        fetch(.characters(nameStartsWith: name, offset: offset, limit: limit), completion)
    }
    
    func addToFavorite(character: Character, _ completion: @escaping (Result<Character, ServiceError>) -> Void) {
        var newCharacter = character
        newCharacter.isFavorite = true
        completion(.success(newCharacter))
    }
    
    func removeFromFavorite(character: Character, _ completion: @escaping (Result<Character, ServiceError>) -> Void) {
        var newCharacter = character
        newCharacter.isFavorite = false
        completion(.success(newCharacter))
    }
}
