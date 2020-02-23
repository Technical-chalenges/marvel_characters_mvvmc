import Foundation
import UIKit
import Moya

class CharactersCoordinator: Coordinator {
    let window: UIWindow
    let apiProvider: MoyaProvider<API>
    var navigationController: UINavigationController!
    var characterCoordinator: CharacterCoordinator!
    weak var delegate: CharactersCoordinatorDelegate?
    init(window: UIWindow, apiProvider: MoyaProvider<API>) {
        self.window = window
        self.apiProvider = apiProvider
    }
    
    func start() {
        showCharacters()
    }
    
    func showCharacters() {
        let characterService = CharactersService(provider: apiProvider)
        let charactersVM = CharactersVM(service: characterService)
        
        let charactersVC = CharactersVC(viewModel: charactersVM)
        charactersVM.coordinatorDelegate = self
        charactersVM.viewDelegate = charactersVC
        charactersVC.viewModel = charactersVM
        
        navigationController =  UINavigationController(rootViewController: charactersVC)
        window.rootViewController = navigationController
    }
    
    func showCharacter(character: Character) {
        characterCoordinator = CharacterCoordinator(
            navigationController: navigationController,
            apiProvider: apiProvider,
            character: character)
        
        characterCoordinator.delegate = self
        characterCoordinator.start()
    }
}

extension CharactersCoordinator: CharactersViewModelCoordinatorDelegate {
    func didSelect(viewModel: CharactersVMP, character: Character) {
        showCharacter(character: character)
    }
    
    func didFinish(viewModel: CharactersVMP) {
        delegate?.didFinish()
    }
}

extension CharactersCoordinator: CharacterCoordinatorDelegate {
    func didFinish() {
        characterCoordinator = nil
    }
}
