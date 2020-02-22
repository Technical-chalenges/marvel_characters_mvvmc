//
//  CharactersCoordinator.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 19.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation
import UIKit
import Moya

class CharactersCoordinator: Coordinator {
    let window: UIWindow
    let apiProvider: MoyaProvider<API>
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
        charactersVM.coordinatorDelegate = self
        
        let charactersVC = CharactersVC.instantiate()
        charactersVC.viewModel = charactersVM
        charactersVM.paginableViewDelegate = charactersVC
        let navigationController =  UINavigationController(rootViewController: charactersVC)
        window.rootViewController = navigationController
    }
    
    func showCharacter() {
    }
}

extension CharactersCoordinator: CoordinatorDelegate {
    
}
