//
//  CharactersVMP.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 21.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

protocol CharactersVMP: BaseVMP {
    var service: CharactersSP { get }
    var items: [Character] { get }
    func loadCharacters()
    func reloadCharacters()
    func showCharacter(index: Int)
}
