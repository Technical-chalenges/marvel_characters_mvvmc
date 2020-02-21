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
    var window: UIWindow
    
    let apiProvider = MoyaProvider<API>()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        showCharacters()
    }
    
    func showCharacters() {
        let charactersVM = CharactersVM()
        charactersVM.coordinatorDelegate = self
        charactersVM.service = CharactersService(provider: apiProvider)
        
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
