//
//  ListHeroeWorkerInterface.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 15/4/22.
//

import Foundation

protocol ListHeroeWorkerInterface {
    func loadLists<T: Encodable>(withParams params: T) async throws -> List<Heroe>
}
