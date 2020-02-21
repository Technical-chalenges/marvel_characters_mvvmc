//
//  PaginableVM.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 21.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

class PaginableVM<ModelType>: BaseVM, PaginableVMP {
    weak var paginableViewDelegate: PaginableViewDelegate?
    
    typealias T = ModelType
    var items: [ModelType]
    var pageSize: Int
    var totalSize: Int?
    var isLoading: Bool
    
    override init() {
        items = [ModelType]()
        pageSize = 20
        isLoading = false
        super.init()
    }
    
    func loadItems(offset: Int, limit: Int, _ completion: @escaping (Result<[ModelType], ServiceError>) -> Void) {
        preconditionFailure("This method must be overridden")
    }
    
    func loadMoreItems(clear: Bool = false) {
        guard !isLoading else { return }
        if let totalSize = totalSize, totalSize >= items.count {
            paginableViewDelegate?.loadingFinished()
            return
        }
        
        isLoading = true
        let offset = clear ? 0 : items.count
        loadItems(offset: offset, limit: pageSize) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                if (clear) {
                    self.items.removeAll()
                }
                self.items.append(contentsOf: data)
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
            
            self.isLoading = false
            self.paginableViewDelegate?.loadingFinished()
        }
    }
}
