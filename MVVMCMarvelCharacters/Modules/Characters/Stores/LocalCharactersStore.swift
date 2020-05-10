
// сервис для локального хранения героев
class LocalCharactersStore: CharactersStore {
    func fetchCharacters(by name: String?, offset: Int, limit: Int, _ completion: @escaping (Result<[Character], ServiceError>) -> Void) {
        // нет задачи работать с локальными героями
    }
    
    func addToFavorite(character: Character, _ completion: @escaping (Result<Character, ServiceError>) -> Void) {
        // нет задачи работать с локальными героями
    }
    
    func removeFromFavorite(character: Character, _ completion: @escaping (Result<Character, ServiceError>) -> Void) {
        // нет задачи работать с локальными героями
    }
    
}
