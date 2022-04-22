//
//  ComicsDTO.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 13/4/22.
//

import Foundation

public struct ComicsDTO: Codable {
    let id: Int?
    let digitalId: Int
    let title: String?
    let issueNumber: Int?
    let varianDescription: String?
    let description: String?
    let modified: String?
    let isbn: String?
    let upc: String?
    let diamiondCode: String?
    let ean: String?
    let issn: String?
    let format: String?
    let pageCount: Int?
    let thumbnail: ImageDTO?
}
