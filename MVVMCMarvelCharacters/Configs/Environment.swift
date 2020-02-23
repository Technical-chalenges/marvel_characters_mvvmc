import Foundation

public enum Environment {
    enum Keys {
      enum Plist {
        static let baseURL = "BASE_URL"
        static let privateKey = "PRIVATE_KEY"
        static let publicKey = "PUBLIC_KEY"
      }
    }
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    static let baseURL:URL = {
        guard let stringURL = Environment.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("baseURL not set in plist for this environment")
        }
        
        guard let baseURL = URL(string: stringURL) else {
            fatalError("base URL is invalid")
        }
        
        return baseURL
    }()
    
    static let privateKey: String = {
        guard let privateKey = Environment.infoDictionary[Keys.Plist.privateKey] as? String else {
            fatalError("PRIVATE Key not set in plist for this environment")
        }
        return privateKey
    }()
    
    static let publicKey: String = {
        guard let publicKey = Environment.infoDictionary[Keys.Plist.publicKey] as? String else {
            fatalError("PUBLIC Key not set in plist for this environment")
        }
        return publicKey
    }()
}
