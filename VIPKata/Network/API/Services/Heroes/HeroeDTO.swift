//
//  HeroeDTO.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 6/4/22.
//

import Foundation

public struct HeroeDTO: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let modified: String?
    let thumbnail: ImageDTO?
    let resourceURI: String?
}
