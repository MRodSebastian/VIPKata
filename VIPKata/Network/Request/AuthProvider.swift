//
//  AuthProvider.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 6/4/22.
//

import Foundation

public class AuthProvider {
    
    func authParams() -> [URLQueryItem] {
        let timestamp = "\(Int(Date().timeIntervalSince1970))"
        let stringToEncrypt = String(format: "%@%@%@", timestamp, APIConstants.privateKey, APIConstants.apiKey)
        let hash = Encrypter.md5(string: stringToEncrypt)
        
        return [
            URLQueryItem(name: "ts", value: timestamp),
            URLQueryItem(name: "hash", value: hash),
            URLQueryItem(name: "apikey", value: APIConstants.apiKey)
        ]
    }
    
}
