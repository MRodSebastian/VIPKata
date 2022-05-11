//
//  HeroeDTOMother.swift
//  VIPKataTests
//
//  Created by Manuel Rodriguez on 11/5/22.
//

import Foundation
@testable import VIPKata

struct HeroeDTOMother {
    
    static var heroe: HeroeDTO {
        return HeroeDTO(
            id: 0,
            name: "test",
            description: "description",
            modified: nil,
            thumbnail: ImageDTO(path: "test", extension: "jpt"),
            resourceURI: nil
        )
    }
    
}

