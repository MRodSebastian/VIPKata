//
//  ListMapper.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 11/4/22.
//

import Foundation

public class ListMapper {
    public static func transform(dto: APIResponseListDTO<HeroeDTO>) -> List<Heroe> {
        let heroes = dto.results?.compactMap{ HeroeMapper.transform(dto: $0) } ?? [Heroe]()
        
        return List<Heroe>(
            offset: dto.offset ?? 0,
            limit: dto.limit ?? 0,
            total: dto.total ?? 0,
            count: dto.count ?? 0,
            results: heroes
        )
    }
    
    public static func transform(dto: APIResponseListDTO<ComicsDTO>) -> List<Comic> {
        let comics = dto.results?.compactMap{ ComicMapper.transform(dto: $0) } ?? [Comic]()
        
        return List<Comic>(
            offset: dto.offset ?? 0,
            limit: dto.limit ?? 0,
            total: dto.total ?? 0,
            count: dto.count ?? 0,
            results: comics
        )
    }
}
