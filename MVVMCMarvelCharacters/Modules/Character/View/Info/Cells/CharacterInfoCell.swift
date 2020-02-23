//
//  CharacterInfoCell.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 23.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterInfoCell: UITableViewCell {
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var comicsCountLabel: UILabel!
    @IBOutlet weak var seriesCountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(vm: CharacterInfoVMP) {
        if let url = vm.thumbnail?.url {
            thumbnailImage.kf.indicatorType = .activity
            thumbnailImage.kf.setImage(
                with: url,
                placeholder: UIImage(named: "character_placeholder"),
                options: [.transition(.fade(0.3))])
        } else {
            thumbnailImage.image = UIImage(named: "character_placeholder")
        }
        
        nameLabel.text = vm.name
        comicsCountLabel.text = String(vm.totalComics)
        seriesCountLabel.text = String(vm.totalSeries)
        descriptionLabel.text = vm.description
    }
    
}
