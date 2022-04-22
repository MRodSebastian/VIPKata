//
//  DetailHeroeViewModel.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 13/4/22.
//

import Foundation

struct DetailHeroeViewModel {
    let imageURL: URL?
    let name: String
    let description: String?
    
    public var hideDescription: Bool {
        return description == nil
    }
    
    init(withHeroe heroe: Heroe) {
        self.imageURL = heroe.imageURL
        self.name = heroe.name
        self.description = heroe.description
    }
}
