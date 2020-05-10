import Foundation

class Favorites: ObservableObject {
    enum type: String {
        case characters = "characters"
    }
    static let shared = Favorites()
    
    private var characters: Set<Int>
    
    init() {
        characters = []

        if let savedCharacters = UserDefaults.standard.object(forKey: type.characters.rawValue) as? Data {
            characters = NSKeyedUnarchiver.unarchiveObject(with: savedCharacters) as! Set<Int>
        }
    }
    
    func contains(_ character: Character) -> Bool {
        return characters.contains(character.id)
    }
    
    func add(_ character: Character) {
        objectWillChange.send()
        characters.insert(character.id)
        save()
    }
    
    func remove(_ character: Character) {
        objectWillChange.send()
        characters.remove(character.id)
        save()
    }
    
    func save() {
        if let encodedData = try? NSKeyedArchiver.archivedData(withRootObject: characters, requiringSecureCoding: false) {
            UserDefaults.standard.set(encodedData, forKey: type.characters.rawValue)
        }
    }
}
