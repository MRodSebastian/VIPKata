//
//  APIError.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 11/4/22.
//

import Foundation

public enum APIError: Error {
    case invalidURL
    case parsingError
    case httpError(statusCode: Int?, message: String?)
    case customError(statusCode: Int, message: String)
}
