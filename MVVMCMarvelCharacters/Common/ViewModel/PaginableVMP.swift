//
//  PaginableVMP.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 21.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

protocol PaginableVMP: BaseVMP {
    var paginableViewDelegate: PaginableViewDelegate? { get }
    
    associatedtype T
    var items: [T] { get }
    var pageSize: Int { get }
    var totalSize: Int? { get }
    var isLoading: Bool { get }
    
    func loadMoreItems(clear: Bool)
}
