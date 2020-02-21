//
//  CharactersVM.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 21.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

class CharactersVM: PaginableVM<Character>, CharactersVMP {
    var service: CharactersSP?
    
    override var title: String {
        "Characters"
    }
    
    func loadCharacters() {
        loadMoreItems()
    }
    
    func reloadCharacters() {
        loadMoreItems(clear: true)
    }
    
    override func loadItems(offset: Int, limit: Int, _ completion: @escaping (Result<[Character], ServiceError>) -> Void) {
        service?.fetchCharacters(offset: offset, limit: limit, completion)
    }
}
