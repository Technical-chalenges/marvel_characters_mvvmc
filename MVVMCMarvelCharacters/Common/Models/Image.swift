//
//  Image.swift
//  characters
//
//  Created by Alexandr on 01.01.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//
import Foundation

struct Image: Codable {
    let path: String?
    let `extension`: String?
    
    var url: URL? {
        guard let path = path else { return nil }
        guard let `extension` = `extension` else { return nil }
        return URL(string: path + "." + `extension`)!
    }
}
