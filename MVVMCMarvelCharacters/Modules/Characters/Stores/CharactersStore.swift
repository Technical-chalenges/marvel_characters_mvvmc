protocol CharactersStore {
     func fetchCharacters(
           by name: String?,
           offset: Int,
           limit: Int,
           _ completion: @escaping (Result<[Character], ServiceError>) -> Void)
       
       func addToFavorite(
           character: Character,
           _ completion: @escaping (Result<Character, ServiceError>) -> Void)
       
       func removeFromFavorite(
           character: Character,
           _ completion: @escaping (Result<Character, ServiceError>) -> Void)
}
