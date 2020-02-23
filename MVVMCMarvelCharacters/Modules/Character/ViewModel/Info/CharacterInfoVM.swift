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
    var thumbnail: Image? {
        character.thumbnail
    }
    
    var name: String? {
        character.name
    }
    
    var description: String? {
        character.description
    }
    
    var totalComics: Int {
        guard let count = character.comics?.available else { return 0 }
        return count
    }
    
    var totalSeries: Int{
        guard let count = character.series?.available else { return 0 }
        return count
    }
    
    var sectionType = CharacterSectionType.info
    
    init(character: Character) {
        self.character = character
    }
}
