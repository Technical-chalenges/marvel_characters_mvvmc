//
//  CharactersVMP.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 21.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

protocol CharactersVMP: PaginableVMP {
    var service: CharactersSP? { get set }
    func loadCharacters()
    func reloadCharacters()
}
