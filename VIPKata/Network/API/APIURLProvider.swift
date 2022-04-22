//
//  APIURLProvider.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 6/4/22.
//

import Foundation

public class APIURLProvider {
    
    private var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }
    
    public func charactersURL() -> URL {
        return baseURL.appendingPathComponent("characters")
    }
    
    public func characterURL(withIdentifier identifier: String) -> URL {
        return baseURL.appendingPathComponent(String(format: "characters/%@", identifier))
    }
    
    public func comics(withHeroeIdenfieri identifier: String) -> URL {
        return baseURL.appendingPathComponent(String(format: "characters/%@/comics", identifier))
    }
}
