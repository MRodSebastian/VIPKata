//
//  ComicMapper.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 13/4/22.
//

import Foundation

public class ComicMapper {
    public static func transform(dto: ComicsDTO) -> Comic? {
        guard let identifier = dto.id else { return nil }
        guard let title = dto.title else { return nil }
        
        let imageURL: URL?
        if let filePath = dto.thumbnail?.path, let fileExtension = dto.thumbnail?.extension {
            let imageURLString = String(format: "%@.%@", filePath, fileExtension)
            imageURL = URL(string: imageURLString)
        } else {
            imageURL = nil
        }
        
        return Comic(id: identifier, title: title, imageURL: imageURL)
    }
}
