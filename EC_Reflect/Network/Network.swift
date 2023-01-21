//
//  Network.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 20/01/23.
//

import Foundation

class Network: NSObject {
    
    /// Create a single instance on Network class
    static let shared = Network()
    
    /// Create a urlSession object, use this to perform requests
    let session: URLSession = URLSession(configuration: .default)
    
    /// URLComponents, use this to create and manipulate endpoints
    var urlComponent = URLComponents(string: "https://api.api-ninjas.com")
    
    /// Decoder for JSON `Data`.
    lazy var decoder = JSONDecoder()
    
    /// Encoder for JSON `Data`.
    lazy var encoder = JSONEncoder()
    
    func get(path: String, apiKey: String, queryItems: [URLQueryItem]) async throws -> [Quote]? {
        
        let request = buildRequest(
            method: "GET",
            path: path,
            apiKey: apiKey,
            queryItems: queryItems
        )
        
        let data = try await perform(request: request)
        
        return try JSONDecoder().decode([Quote].self, from: data)
    }
    
}
