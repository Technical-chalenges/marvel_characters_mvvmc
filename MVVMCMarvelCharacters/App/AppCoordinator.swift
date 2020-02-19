//
//  AppCoordinator.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 19.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        showCharacters()
    }
}

extension AppCoordinator {
    func showCharacters() {
    }
}
