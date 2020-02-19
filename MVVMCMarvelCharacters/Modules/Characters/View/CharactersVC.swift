//
//  CharactersVC.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 20.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class CharactersVC: UIViewController, Storyboarded {
    static var storyboard = AppStoryboard.characters
    
    @IBOutlet weak var tableView: UITableView!
}
