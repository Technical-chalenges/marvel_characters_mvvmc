//
//  CharactersCoordinatorDelegate.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 23.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

protocol CharactersCoordinatorDelegate: AnyObject {
    func characterDidSelected(charactersViewModel: CharactersVMP, character: Character)
}
