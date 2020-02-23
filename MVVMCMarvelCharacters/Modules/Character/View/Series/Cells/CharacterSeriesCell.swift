//
//  CharacterSeriesCell.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 23.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class CharacterSeriesCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: CharacterSeriesVMP!
    var seriesDataSource: SeriesDataSource!
    var tableViewDelegate: InfiniteViewDelegate!
    func configure(vm: CharacterSeriesVMP) {
        viewModel = vm
        viewModel.paginableViewDelegate = self
        initByViewModel()
    }
    
    private func initByViewModel() {
        seriesDataSource = SeriesDataSource(viewModel: viewModel)
        seriesDataSource.configure(collectionView)
        
        tableViewDelegate = InfiniteViewDelegate(direction: .horisontal, sensivity: 0.8)
        tableViewDelegate.EndReachedClosure = viewModel.loadSeries
        tableViewDelegate.configure(collectionView: collectionView)
        viewModel.loadSeries()
    }
}

extension CharacterSeriesCell: PaginableViewDelegate {
    func itemsDidLoad() {
        collectionView.reloadData()
    }
}
