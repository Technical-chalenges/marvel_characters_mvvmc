//
//  SeriesViewModelProtocol.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 23.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

protocol CharacterSeriesVMP: CharacterRepresentable {
    var paginableViewDelegate: PaginableViewDelegate? { get set }
    var service: SeriesServiceP? { get }
    var items: [Series] { get }
    
    func loadSeries()
}
