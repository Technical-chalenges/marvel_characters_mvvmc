import UIKit
import Moya

class CharacterCoordinator: BaseCoordinator {
    let apiProvider: MoyaProvider<API>
    let character: Character
    
    init(apiProvider: MoyaProvider<API>, character: Character) {
        self.apiProvider = apiProvider
        self.character = character
    }
    
    override func start() {
        showCharacter()
    }
    
    private func showCharacter() {
        let comicsService = ComicsService(provider: apiProvider)
        let seriesService = SeriesService(provider: apiProvider)
        let viewModel = CharacterVM(
            character: character,
            comicsService: comicsService,
            seriesService: seriesService)
        
        let characterVC = CharacterVC(viewModel: viewModel)
        navigationController.delegate = self
        navigationController.pushViewController(characterVC, animated: true)
    }
}

extension CharacterCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if fromViewController is CharacterVC {
            parentCoordinator?.didFinish(coordinator: self)
        }
    }
}
