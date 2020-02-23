//
//  CharacterInfoVM.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 23.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

class CharacterInfoVM: CharacterInfoVMP {
    var character: Character
    
    var sectionTitle: String? {
        "characterInfo"
    }
    
    var name: String? {
        character.name
    }
    
    var description: String? {
        character.description
    }
    
    var totalComics: Int? {
        character.comics?.available
    }
    
    var totalSeries: Int?{
     character.series?.available
    }
    
    var sectionType = CharacterSectionType.info
    
    init(character: Character) {
        self.character = character
    }
}
