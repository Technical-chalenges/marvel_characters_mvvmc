//
//  UIImageView+LoadByUrl.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 23.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

extension UIImageView {
    func byUrl(url: URL?, placeholder: String) {
        if let url = url {
            self.kf.indicatorType = .activity
            self.kf.setImage(
                with: url,
                placeholder: UIImage(named: placeholder),
                options: [.transition(.fade(0.3))])
        } else {
            self.image = UIImage(named: placeholder)
        }
    }
}
