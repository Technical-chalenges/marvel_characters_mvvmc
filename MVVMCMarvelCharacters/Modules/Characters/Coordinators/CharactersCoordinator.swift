import Foundation
import UIKit
import Moya

class CharactersCoordinator: BaseCoordinator {
    let apiProvider: MoyaProvider<API>
    var characterService: CharactersService!
    var charactersVM: CharactersViewModel!
    var charactersVC: CharactersVC!
    init(apiProvider: MoyaProvider<API>) {
        self.apiProvider = apiProvider
    }
    
    override func start() {
        showCharacters()
    }
    
    private func showCharacters() {
        characterService = CharactersService(provider: apiProvider)
        charactersVM = CharactersViewModel(service: characterService)
        charactersVC = CharactersVC(viewModel: charactersVM)
        charactersVM.charactersCoordinatorDelegate = self
        charactersVM.viewDelegate = charactersVC
        charactersVM.loadableViewDelegate = charactersVC
        charactersVC.viewModel = charactersVM
        navigationController.viewControllers = [charactersVC]
    }
    
    private func showCharacter(character: Character) {
        let characterCoordinator = CharacterCoordinator(
            apiProvider: apiProvider,
            character: character)
        
        characterCoordinator.navigationController = navigationController
        characterCoordinator.characterCoordinatorDelegate = self
        start(coordinator: characterCoordinator)
    }
}

extension CharactersCoordinator: CharacterCoordinatorDelegate {
    func characterStateChanged(character: Character) {
        var items = charactersVM.items
        guard let index = items.firstIndex(where: {$0.id == character.id}) else { return }
        items[index] = character
        charactersVM.items = items
    }
}

extension CharactersCoordinator: CharactersViewModelCoordinatorDelegate {
    func didSelect(viewModel: CharactersViewModelProtocol, character: Character) {
        showCharacter(character: character)
    }
}
