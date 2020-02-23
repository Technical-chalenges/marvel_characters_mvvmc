//
//  CharacterCoordinator.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 22.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit
import Moya

class CharacterCoordinator: Coordinator {
    let apiProvider: MoyaProvider<API>
    let navigationController: UINavigationController
    let character: Character
    
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
        let characterVC = CharacterVC(viewModel: viewModel)
        navigationController.pushViewController(characterVC, animated: true)
    }
}
