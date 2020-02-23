//
//  CharacterRepresentable.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 23.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

protocol CharacterRepresentable {
    var sectionTitle: String? { get }
    var character: Character { get }
    var sectionType: CharacterSectionType { get }
}
