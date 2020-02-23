//
//  CharacterComicsVMP.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 23.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

protocol CharacterComicsVMP: CharacterRepresentable {
    var service: ComicsServiceP? { get }
    var items: [Comic] { get }
    
    func loadComics()
}
