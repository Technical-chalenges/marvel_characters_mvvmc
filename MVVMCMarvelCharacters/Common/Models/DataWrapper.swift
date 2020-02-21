//
//  DataWrapper.swift
//  characters
//
//  Created by Alexandr on 02.01.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

struct DataWrapper<Response: Codable>: Codable {
    let status: String?
    let message: String?
    let data: DataContainer<Response>?
}
