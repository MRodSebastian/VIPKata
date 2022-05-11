//
//  ComicDTOMother.swift
//  VIPKataTests
//
//  Created by Manuel Rodriguez on 11/5/22.
//

import Foundation
@testable import VIPKata

struct ComicDTOMother {
    
    private static let id: Int = 0
    private static let title: String = "title"
    private static let imageURL = URL(string: "https://www.google.com/")!
    
    static var comic: ComicsDTO {
        return ComicsDTO(
            id: 0,
            digitalId: 0,
            title: "title",
            issueNumber: nil,
            varianDescription: nil,
            description: nil,
            modified: nil,
            isbn: nil,
            upc: nil,
            diamiondCode: nil,
            ean: nil,
            issn: nil,
            format: nil,
            pageCount: 999,
            thumbnail: ImageDTO(path: "test", extension: "jpg")
        )
    }
    
}
