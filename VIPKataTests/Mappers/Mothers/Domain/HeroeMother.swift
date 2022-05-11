//
//  HeroeMother.swift
//  VIPKataTests
//
//  Created by Manuel Rodriguez on 11/5/22.
//

import Foundation
@testable import VIPKata

struct HeroeMother {
    
    private static let id: Int = 0
    private static let name: String = "name"
    private static let description: String = "description"
    private static let imageURL = URL(string: "https://www.google.com/")!
    
    static var heroe: Heroe {
        return Heroe(id: id, name: name, description: description, imageURL: imageURL)
    }
}
