//
//  DetailHeroInterfactorInterface.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 13/4/22.
//

import Foundation

typealias DetailHeroeInteractorInput = DetailHeroeViewControllerOutput

protocol DetailHeroeInteractorOutput: AnyObject {
    func didLoadHeroe(heroe: Heroe)
    func didLoadComics(comicsList: List<Comic>)
    func didFailed()
}
