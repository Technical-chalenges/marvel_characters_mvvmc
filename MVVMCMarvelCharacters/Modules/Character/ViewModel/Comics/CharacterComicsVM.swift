//
//  CharacterComicsVM.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 23.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

class CharacterComicsVM: PaginableVM<Comic>, CharacterComicsVMP {
    var sectionType = CharacterSectionType.comics
    var character: Character
    var service: ComicsServiceP?
    var sectionTitle: String? {
        "comics"
    }
    
    init(character: Character) {
        self.character = character
        super.init()
        self.totalSize = character.comics?.available
    }
    
    func loadComics() {
        loadMoreItems(clear: false)
    }
    
    override func loadItems(offset: Int, limit: Int, _ completion: @escaping (Result<[Comic], ServiceError>) -> Void) {
        service?.fetchComics(characterId: character.id, offset: offset, limit: limit, completion)
    }
}
