//
//  DetailHeroeWorker.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 15/4/22.
//

import Foundation

class DetailHeroeWorker {
    private(set) var isLoading: Bool = false
    private let heroeService = HeroesService()
    private let comicService = ComicsService()
}

extension DetailHeroeWorker: DetailHeroeWorkerInterface {
    func loadHeroe(withIdentifier identifier: String) async throws -> Heroe {
        do {
            isLoading = true
            let heroesListDTO = try await heroeService.character(withIdentifier: identifier)
            isLoading = false
            let heroeList = ListMapper.transform(dto: heroesListDTO)
            if let heroe = heroeList.results.first {
                return heroe
            } else {
                throw APIError.parsingError
            }
        }
    }
    
    func loadComics(withHeroeIdentifier heroeIdentifier: String) async throws -> List<Comic> {
        do {
            isLoading = true
            let comicsListDTO = try await comicService.comics(withHeroeIdenfier: heroeIdentifier)
            isLoading = false
            let comicsList = ListMapper.transform(dto: comicsListDTO)
            return comicsList
        }
    }
}
