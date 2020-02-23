import UIKit
import Moya

class CharacterCoordinator: Coordinator {
    let apiProvider: MoyaProvider<API>
    let navigationController: UINavigationController
    let character: Character
    weak var delegate: CharacterCoordinatorDelegate?
    
    init(navigationController: UINavigationController, apiProvider: MoyaProvider<API>, character: Character) {
        self.navigationController = navigationController
        self.apiProvider = apiProvider
        self.character = character
    }
    
    func start() {
        showCharacter()
    }
    
    private func showCharacter() {
        let comicsService = ComicsService(provider: apiProvider)
        let seriesService = SeriesService(provider: apiProvider)
        let viewModel = CharacterVM(character: character, comicsService: comicsService, seriesService: seriesService)
        viewModel.coordinatorDelegate = self
        let characterVC = CharacterVC(viewModel: viewModel)
        navigationController.pushViewController(characterVC, animated: true)
    }
}

extension CharacterCoordinator: CharacterCoordinatorViewModelDelegate {
    func didFinish() {
        delegate?.didFinish()
    }
}
