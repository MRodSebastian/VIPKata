//
//  APIResponseDTO.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 8/4/22.
//

import Foundation

struct APIResponseDTO<Response: Codable>: Codable {
    let code: Int?
    let status: String?
    let data: Response?
}
