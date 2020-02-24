//
//  CharacterCoordinatorDelegate.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 24.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

protocol CharacterCoordinatorDelegate: AnyObject {
    func characterStateChanged(character: Character)
}
