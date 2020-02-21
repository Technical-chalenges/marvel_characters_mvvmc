//
//  CharactersSP.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 21.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

protocol CharactersSP {
    func fetchCharacters(offset: Int, limit: Int, _ completion: @escaping (Result<[Character], ServiceError>) -> Void)
}
