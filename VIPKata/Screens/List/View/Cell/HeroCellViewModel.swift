//
//  HeroCellViewModel.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 12/4/22.
//

import Foundation

struct HeroCellViewModel {
    let imageURL: URL?
    let name: String
    let description: String
    
    init(heroe: Heroe) {
        self.imageURL = heroe.imageURL
        self.name = heroe.name
        self.description = heroe.description ?? ""
    }
}
