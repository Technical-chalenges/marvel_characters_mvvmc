//
//  BaseVM.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 21.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

class BaseVM: BaseVMP {
    var viewDelegate: ViewDelegate?
    var coordinatorDelegate: CoordinatorDelegate?
    
    var title: String {
        ""
    }
    var errorMessage: String? {
        didSet {
            viewDelegate?.errorMessageChanged()
        }
    }
}
