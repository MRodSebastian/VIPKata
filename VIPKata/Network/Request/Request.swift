//
//  Request.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 5/4/22.
//

import Foundation
import Alamofire

class Request {
    
    private static let authProvider = AuthProvider()
    
    static func get<T: Encodable, V: Codable>(url: URL, withParameters parameters: T, encoder: ParameterEncoder = URLEncodedFormParameterEncoder.default, headers: HTTPHeaders? = nil) async throws -> V {
        return try await Request.request(url: url, method: .get, parameters: parameters, encoder: encoder, headers: headers)
    }
    
    static func get<T: Codable>(url: URL, headers: HTTPHeaders? = nil) async throws -> T {
        return try await Request.request(url: url, method: .get, headers: headers)
    }
    
    private static func request<T: Codable>(url: URL, method: HTTPMethod, headers: HTTPHeaders? = nil) async throws -> T {
        try await withCheckedThrowingContinuation{ continuation in
            
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            components?.queryItems = authProvider.authParams()
                              
            guard let urlRequest = components?.url else {
                continuation.resume(throwing: APIError.invalidURL)
                return
            }
            
            AF.request(
                urlRequest,
                method: method,
                headers: headers
            )
            .validate()
            .responseDecodable(of: APIResponseDTO<T>.self, completionHandler: { response in
                continuation.resume(with: self.mapResponse(response: response))
            })
        }
    }
    
    private static func request<T: Encodable, V: Codable>(url: URL, method: HTTPMethod, parameters: T, encoder: ParameterEncoder = URLEncodedFormParameterEncoder.default, headers: HTTPHeaders? = nil) async throws -> V {
        try await withCheckedThrowingContinuation { continuation in
            
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            components?.queryItems = authProvider.authParams()
            
            guard let urlRequest = components?.url else {
                continuation.resume(throwing: APIError.invalidURL)
                return
            }
            
            AF.request(
                urlRequest,
                method: method,
                parameters: parameters,
                encoder: encoder,
                headers: headers
            )
            .validate()
            .responseDecodable(of: APIResponseDTO<V>.self, completionHandler: { response in
                continuation.resume(with: self.mapResponse(response: response))
            })
        }
    }
    
    private static func mapResponse<V: Codable>(response: DataResponse<APIResponseDTO<V>, AFError>) -> Result<V, APIError> {
        switch response.result {
        case .success(let responseDTO):
            switch responseDTO.code {
            case 200:
                return self.mapReceivedResponse(response: response)
            default:
                return self.mapReceivedError(response: response)
            }
        case .failure:
            return self.mapReceivedError(response: response)
        }
    }
    
    private static func mapReceivedResponse<V: Codable>(response: DataResponse<APIResponseDTO<V>, AFError>) -> Result<V, APIError> {
        guard let receivedData = response.value?.data else {
            return .failure(.parsingError)
        }
        
        return .success(receivedData)
    }
    
    private static func mapReceivedError<V: Codable>(response: DataResponse<APIResponseDTO<V>, AFError>) -> Result<V, APIError> {
        guard let receivedError = response.value else {
            return .failure(.httpError(statusCode: response.error?.responseCode, message: response.error?.localizedDescription))
        }
        
        return .failure(.httpError(statusCode: receivedError.code, message: receivedError.status))
    }
}
