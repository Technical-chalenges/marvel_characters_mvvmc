//
//  CharacterCoordinator.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 22.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class CharacterCoordinator: Coordinator {
    let navigationController: UINavigationController
    let character: Character
    
    init(navigationController: UINavigationController, character: Character) {
        self.navigationController = navigationController
        self.character = character
    }
    
    func start() {
        showCharacter()
    }
    
    private func showCharacter() {
        let viewModel = CharacterVM(character: character)
        let characterVC = CharacterVC(viewModel: viewModel)
        navigationController.pushViewController(characterVC, animated: true)
    }
}
