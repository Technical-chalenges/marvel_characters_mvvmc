//
//  ComicsServiceP.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 23.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

protocol SeriesServiceP {
    func fetchSeries(characterId: Int, offset: Int, limit: Int, _ completion: @escaping (Result<[Series], ServiceError>) -> Void)
}
