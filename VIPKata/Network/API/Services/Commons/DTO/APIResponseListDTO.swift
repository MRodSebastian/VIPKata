//
//  APIResponseListDTO.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 8/4/22.
//

import Foundation

public struct APIResponseListDTO<T: Codable>: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [T]?
}
