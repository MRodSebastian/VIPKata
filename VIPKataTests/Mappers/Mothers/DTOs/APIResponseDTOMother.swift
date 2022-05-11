//
//  APIResponseDTOMother.swift
//  VIPKataTests
//
//  Created by Manuel Rodriguez on 11/5/22.
//

import Foundation
@testable import VIPKata

struct APIResponseDTOMother {
    
    func generateResponseList<T: Codable>(withList list: [T]) -> APIResponseListDTO<T> {
        return APIResponseListDTO(offset: 20, limit: 20, total: 20, count: 20, results: list)
    }

}
