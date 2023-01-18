//
//  QuoteViewModel.swift
//  EC_Reflect
//
//  Created by Ariuna Banzarkhanova on 18/01/23.
//

import Foundation

@MainActor
class QuoteViewModel: ObservableObject {
    
    @Published var quote: [Quote]?
    
    let decoder = JSONDecoder()
    
    var urlComponents = URLComponents(string: "https://api.api-ninjas.com")
    
    func getQuote() async {
        do {
            urlComponents!.path = "/v1/quotes"
            urlComponents?.queryItems = [URLQueryItem(name: "category", value: "inspirational")]
            
            var request = URLRequest(url: urlComponents!.url!)
            
            request.setValue(
                "P4jKiNzcdmk2Sl45KdpXRA==1VhEpeajatu91FgP",
                forHTTPHeaderField: "X-Api-Key"
            )
            
            request.httpMethod = "GET"
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            
            print(String(data: data, encoding: .utf8))
            
            
            self.quote = try decoder.decode([Quote].self, from: data)
            
            
        } catch {
            
            print(error)
            
        }
    }
}
