//
//  ListHeroeWorker.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 15/4/22.
//

import Foundation

class ListHeroeWorker {
    private let service = HeroesService()
}

extension ListHeroeWorker: ListHeroeWorkerInterface {
    func loadLists<T: Encodable>(withParams params: T) async throws -> List<Heroe> {
        do {
            let heroesListDTO = try await service.characters(withParameters: params)
            return ListMapper.transform(dto: heroesListDTO)
        }
    }
}
