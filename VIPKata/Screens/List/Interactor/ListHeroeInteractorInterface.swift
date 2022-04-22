//
//  ListHeroeInteractorInterface.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 5/4/22.
//

import Foundation

typealias ListHeroeInteractorInput = ListHeroeViewControllerOutput

protocol ListHeroeInteractorOutput: AnyObject {
    func didLoadList()
    func didFailed()
    func didSelectHeroe(heroe: Heroe)
}
