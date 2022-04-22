//
//  HeroeMapper.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 6/4/22.
//

import Foundation

public class HeroeMapper {
    public static func transform(dto: HeroeDTO) -> Heroe? {
        guard let identifier = dto.id else { return nil }
        guard let name = dto.name else { return nil }
        
        let imageURL: URL?
        if let filePath = dto.thumbnail?.path, let fileExtension = dto.thumbnail?.extension {
            let imageURLString = String(format: "%@.%@", filePath, fileExtension)
            imageURL = URL(string: imageURLString)
        } else {
            imageURL = nil
        }
        
        return Heroe(id: identifier, name: name, description: dto.description, imageURL: imageURL)
    }
}
