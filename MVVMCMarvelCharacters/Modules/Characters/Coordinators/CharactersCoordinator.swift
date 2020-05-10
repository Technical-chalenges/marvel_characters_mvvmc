import Foundation
import UIKit
import Moya

class CharactersCoordinator: BaseCoordinator {
    let apiProvider: MoyaProvider<API>
    var characterService: RemoteCharactersStore!
    var charactersVM: CharactersViewModel!
    var charactersVC: CharactersVC!
    init(apiProvider: MoyaProvider<API>) {
        self.apiProvider = apiProvider
    }
    
    override func start() {
        showCharacters()
    }
    
    private func showCharacters() {
        characterService = RemoteCharactersStore(provider: apiProvider)
        charactersVM = CharactersViewModel(service: characterService, favorites: Favorites.shared)
        charactersVC = CharactersVC(viewModel: charactersVM)
        charactersVM.charactersCoordinatorDelegate = self
        charactersVM.viewDelegate = charactersVC
        charactersVM.paginableViewDelegate = charactersVC
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
    func didSelect(viewModel: CharactersViewModelProtocol, character: Character) {
        showCharacter(character: character)
    }
}
