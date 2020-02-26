import UIKit
import Moya

class AppCoordinator: BaseCoordinator {
    var window = UIWindow(frame: UIScreen.main.bounds)
    let apiProvider = MoyaProvider<API>()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override convenience init() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.init(window: window)
    }
    
    override func start() {
        self.navigationController = UINavigationController()
        self.window.rootViewController = self.navigationController
        self.window.makeKeyAndVisible()
        showCharacters()
    }
}

extension AppCoordinator {
    func showCharacters() {
        let charactersCoordinator = CharactersCoordinator(apiProvider: apiProvider)
        charactersCoordinator.navigationController = navigationController
        self.start(coordinator: charactersCoordinator)
    }
}
