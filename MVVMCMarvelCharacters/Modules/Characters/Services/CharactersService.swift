import Moya

class CharactersService: MoyaService, CharactersServiceProtocol {
    func fetchCharacters(offset: Int, limit: Int, _ completion: @escaping (Result<[Character], ServiceError>) -> Void) {
        fetch(.characters(offset: offset, limit: limit), completion)
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
