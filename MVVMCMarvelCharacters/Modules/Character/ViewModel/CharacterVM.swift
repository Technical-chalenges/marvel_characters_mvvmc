//
//  CharacterViewModel.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 23.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

class CharacterVM: CharacterVMP {
    var character: Character
    var name: String? {
        character.name
    }
    
    var sections: [CharacterRepresentable]
    
    init(character: Character) {
        self.character = character
        sections = [CharacterRepresentable]()
        sections.append(CharacterInfoVM(character: character))
        sections.append(CharacterComicsVM(character: character))
        sections.append(CharacterSeriesVM(character: character))
    }
}
