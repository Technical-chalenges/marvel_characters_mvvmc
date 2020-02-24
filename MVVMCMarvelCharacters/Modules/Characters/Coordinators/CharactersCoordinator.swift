import Foundation
import UIKit
import Moya

class CharactersCoordinator: BaseCoordinator {
    let apiProvider: MoyaProvider<API>
    init(apiProvider: MoyaProvider<API>) {
        self.apiProvider = apiProvider
    }
    
    override func start() {
        showCharacters()
    }
    
    private func showCharacters() {
        let characterService = CharactersService(provider: apiProvider)
        let charactersVM = CharactersVM(service: characterService)
        let charactersVC = CharactersVC(viewModel: charactersVM)
        charactersVM.coordinatorDelegate = self
        charactersVM.paginableViewDelegate = charactersVC
        charactersVC.viewModel = charactersVM
        navigationController.viewControllers = [charactersVC]
    }
    
    private func showCharacter(character: Character) {
        let characterCoordinator = CharacterCoordinator(
            apiProvider: apiProvider,
            character: character)
        
        characterCoordinator.navigationController = navigationController
        start(coordinator: characterCoordinator)
    }
}

extension CharactersCoordinator: CharactersViewModelCoordinatorDelegate {
    func didSelect(viewModel: CharactersVMP, character: Character) {
        showCharacter(character: character)
    }
}
