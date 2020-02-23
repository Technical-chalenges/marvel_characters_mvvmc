//
//  CharacterInfoVMP.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 23.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

protocol CharacterInfoVMP: CharacterRepresentable {
    var name: String? { get }
    var description: String? { get }
    var totalComics: Int? { get }
    var totalSeries: Int? { get }
}
