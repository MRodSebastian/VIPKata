//
//  ComicsService.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 13/4/22.
//

import Foundation
import Alamofire

public class ComicsService {
    
    private let urlProvider: APIURLProvider
    
    init(urlProvider: APIURLProvider = APIURLProvider()) {
        self.urlProvider = urlProvider
    }
    
    public func comics(withHeroeIdenfier identifier: String) async throws -> APIResponseListDTO<ComicsDTO> {
        return try await Request.get(url: urlProvider.comics(withHeroeIdenfieri: identifier))
    }
}
