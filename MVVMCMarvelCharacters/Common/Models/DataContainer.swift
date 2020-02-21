//
//  DataContainer.swift
//  characters
//
//  Created by Alexandr on 02.01.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

struct DataContainer<Results: Codable>: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: Results
}
