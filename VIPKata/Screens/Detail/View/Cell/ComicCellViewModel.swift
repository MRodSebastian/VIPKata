//
//  ComicCellViewModel.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 13/4/22.
//

import Foundation

struct ComicCellViewModel {
    let imageURL: URL?
    let title: String
    
    init(comic: Comic) {
        self.imageURL = comic.imageURL
        self.title = comic.title
    }
}
