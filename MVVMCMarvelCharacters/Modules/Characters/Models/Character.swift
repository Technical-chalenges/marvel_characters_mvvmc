//
//  Character.swift
//  characters
//
//  Created by Alexandr on 01.01.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

struct Character: Codable {
    let id: Int
    let name: String?
    let description: String?
    let thumbnail: Image?
    let comics: ComicList?
    let series: SeriesList?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, description, thumbnail, comics, series
    }
}
