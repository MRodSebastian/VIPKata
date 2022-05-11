//
//  ComicMother.swift
//  VIPKataTests
//
//  Created by Manuel Rodriguez on 11/5/22.
//

import Foundation
@testable import VIPKata

struct ComicMother {
    
    private static let id: Int = 0
    private static let title: String = "title"
    private static let imageURL = URL(string: "https://www.google.com/")!
    
    static var comic: Comic {
        return Comic(id: id, title: title, imageURL: imageURL)
    }
}
