//
//  ControllerVC.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 21.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation
import UIKit

class ControllerVC: UIViewController {
    var viewModel: BaseVMP? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        didSet {
            viewModel?.viewDelegate = self
            proccessViewModel(vm: viewModel)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proccessViewModel(vm: viewModel)
    }
    
     func initByViewModel(with vm: BaseVMP?) {
         title = vm?.title
    }
    
    private func proccessViewModel(vm: BaseVMP?) {
        guard isViewLoaded else { return }
        initByViewModel(with: vm)
    }
}

extension ControllerVC: ViewDelegate {
    func errorMessageChanged() {
    }
}
