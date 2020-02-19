//
//  CharactersCoordinator.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 19.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation
import UIKit

class CharactersCoordinator: Coordinator {
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let charactersVC = CharactersVC.instantiate()
        let navigationController =  UINavigationController(rootViewController: charactersVC)
        window.rootViewController = navigationController
    }
}
