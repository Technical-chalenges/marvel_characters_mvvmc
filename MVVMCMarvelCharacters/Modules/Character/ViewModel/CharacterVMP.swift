//
//  CharacterVMP.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 23.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

protocol CharacterVMP {
    var character: Character { get }
    var name: String? { get }
    var sections: [CharacterRepresentable] { get }
}
