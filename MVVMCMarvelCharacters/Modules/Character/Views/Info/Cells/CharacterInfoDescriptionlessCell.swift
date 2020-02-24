//
//  CharacterInfoDescriptionlessCell.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 24.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class CharacterInfoDescriptionlessCell: UITableViewCell {
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var comicsCountLabel: UILabel!
    @IBOutlet weak var seriesCountLabel: UILabel!
    
    func configure(vm: CharacterInfoViewModelProtocol) {
        thumbnailImage.byUrl(url: vm.thumbnail?.url, placeholder: "character_placeholder")
        nameLabel.text = vm.name
        comicsCountLabel.text = String(vm.totalComics)
        seriesCountLabel.text = String(vm.totalSeries)
    }
}
