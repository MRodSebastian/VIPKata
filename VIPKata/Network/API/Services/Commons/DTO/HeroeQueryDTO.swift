//
//  HeroeQueryDTO.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 6/4/22.
//

import Foundation

public struct HeroeQueryDTO: Codable {
    let name: String?
    let orderBy: OrderByDTO?
    let limit: Int?
    let offset: Int?
    
    init(name: String? = nil, orderBy: OrderByDTO? = nil, limit: Int? = nil, offset: Int? = nil) {
        self.name = name
        self.orderBy = orderBy
        self.limit = limit
        self.offset = offset
    }
    
}
