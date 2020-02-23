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
    
    init(character: Character, comicsService: ComicsServiceP, seriesService: SeriesServiceP) {
        self.character = character
        
        let characterComicsViewModel = CharacterComicsVM(character: character)
        characterComicsViewModel.service = comicsService
        
        let characterSeriesViewModel = CharacterSeriesVM(character: character)
        characterSeriesViewModel.service = seriesService
        
        sections = [CharacterRepresentable]()
        sections.append(CharacterInfoVM(character: character))
        sections.append(characterComicsViewModel)
        sections.append(characterSeriesViewModel)
    }
}
