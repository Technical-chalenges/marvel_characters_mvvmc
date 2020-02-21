//
//  CharactersService.swift
//  characters
//
//  Created by Alexandr on 01.01.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation
import Moya

class CharactersService: MoyaService, CharactersSP {
    func fetchCharacters(offset: Int, limit: Int, _ completion: @escaping (Result<[Character], ServiceError>) -> Void) {
        fetch(.characters(offset: offset, limit: limit), completion)
    }
}
