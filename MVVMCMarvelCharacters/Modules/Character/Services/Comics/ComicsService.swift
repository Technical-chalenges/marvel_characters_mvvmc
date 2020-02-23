//
//  ComicsService.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 23.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

class ComicsService: MoyaService, ComicsServiceP {
    func fetchComics(characterId: Int, offset: Int, limit: Int, _ completion: @escaping (Result<[Comic], ServiceError>) -> Void) {
        fetch(.comics(chracterId: characterId, offset: offset, limit: limit), completion)
    }
}
