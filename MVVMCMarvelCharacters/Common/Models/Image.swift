import Foundation

struct Image: Codable {
    let path: String?
    let `extension`: String?
    
    var url: URL? {
        guard let path = path else { return nil }
        guard let `extension` = `extension` else { return nil }
        return URL(string: path + "." + `extension`)!
    }
}
