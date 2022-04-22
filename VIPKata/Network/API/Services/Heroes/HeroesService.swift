//
//  HeroesService.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 6/4/22.
//

import Foundation
import Alamofire

public class HeroesService {
    
    private let urlProvider: APIURLProvider
    
    init(urlProvider: APIURLProvider = APIURLProvider()) {
        self.urlProvider = urlProvider
    }
    
    public func characters<T: Encodable>(withParameters paramters: T) async throws -> APIResponseListDTO<HeroeDTO> {
        return try await Request.get(url: urlProvider.charactersURL(), withParameters: paramters)
    }
    
    public func character(withIdentifier identifier: String) async throws -> APIResponseListDTO<HeroeDTO> {
        return try await Request.get(url: urlProvider.characterURL(withIdentifier: identifier))
    }
}
