//
//  DetailHeroeWorkerInterface.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 15/4/22.
//

import Foundation

protocol DetailHeroeWorkerInterface {
    var isLoading: Bool { get }
    func loadHeroe(withIdentifier identifier: String) async throws -> Heroe
    func loadComics(withHeroeIdentifier heroeIdentifier: String) async throws -> List<Comic>
}
