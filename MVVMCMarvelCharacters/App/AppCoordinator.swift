import UIKit
import Moya

class AppCoordinator: Coordinator {
    fileprivate let charactersC_KEY = "Characters"
    
    var window: UIWindow
    let apiProvider = MoyaProvider<API>()
    var coordinators = [String:Coordinator]()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        showCharacters()
    }
}

extension AppCoordinator {
    func showCharacters() {
        let charactersCoordinator = CharactersCoordinator(window: window, apiProvider: apiProvider)
        charactersCoordinator.delegate = self
        coordinators[charactersC_KEY] = charactersCoordinator
        charactersCoordinator.start()
    }
}

extension AppCoordinator: CharactersCoordinatorDelegate {
    func didFinish() {
        coordinators.removeValue(forKey: charactersC_KEY)
    }
}
