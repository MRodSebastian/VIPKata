//
//  DetailHeroeComicsViewModel.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 15/4/22.
//

import Foundation

struct DetailHeroeComicsViewModel {
    let numberOfComics: Int
    
    var comicsSectionTitle: String {
        return String(format: "Comics (%d)", numberOfComics)
    }
    
    init(withList comicsList: List<Comic>) {
        self.numberOfComics = comicsList.total
    }
}
