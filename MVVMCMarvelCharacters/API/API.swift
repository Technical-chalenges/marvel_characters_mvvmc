//
//  API.swift
//  characters
//
//  Created by Alexandr on 01.01.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation
import Moya

enum API {
    case characters(offset: Int?, limit: Int?)
    case comics(chracterId: Int, offset: Int?, limit: Int?)
    case series(chracterId: Int, offset: Int?, limit: Int?)
}

extension API: TargetType {
    var baseURL: URL {
        return Environment.baseURL
    }
    
    var path: String {
        switch self {
        case .characters: return "/characters"
        case .comics(let characterId, _, _): return "/characters/\(characterId)/comics"
        case .series(let characterId, _, _): return "/characters/\(characterId)/series"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        let ts = "\(Date().timeIntervalSince1970)"
        let hash = (ts + Environment.privateKey + Environment.publicKey).md5
        var params: [String: Any] = [:]
        params = ["apikey": Environment.publicKey, "ts": ts, "hash": hash]
        
        switch self {
        case .characters(let offset, let limit),
             .comics(_, let offset, let limit),
             .series(_, let offset, let limit):
            params["offset"] = offset
            params["limit"] = limit
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json; charset=UTF-8"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
