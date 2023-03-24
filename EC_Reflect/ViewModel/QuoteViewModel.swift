//
//  QuoteViewModel.swift
//  EC_Reflect
//
//  Created by Ariuna Banzarkhanova on 18/01/23.
//

import Foundation

@MainActor
class QuoteViewModel: ObservableObject {
    
    @Published var quoteLoadable: Loadable = Loadable<[Quote], NetworkError>.idle
    @Published var quoteIndex: Int = 0
    private var lengthQuote = 5
    let userDefaults = UserDefaults.standard
    let encoder = JSONEncoder()
    
    let quotePath: String = "/quotes"
    let quoteApiKey: String = "P4jKiNzcdmk2Sl45KdpXRA==1VhEpeajatu91FgP"
    let quoteQueryItems: [URLQueryItem] = [URLQueryItem(name: "category", value: "inspirational"), URLQueryItem(name: "limit", value: "5")]
    
    func getQuote() async {
        do {
            if case .loading = quoteLoadable { return } 
            quoteLoadable = .loading
            let loaded = try await (Network.shared.get(
                path: quotePath,
                apiKey: quoteApiKey,
                queryItems: quoteQueryItems))
            userDefaults.set(Date(), forKey: "lastUpdate")
            if let encoded = try? encoder.encode(loaded) {
                UserDefaults.standard.set(encoded, forKey: "myQuotes")
            }
            if let quotesData = UserDefaults.standard.data(forKey: "myQuotes"),
               let decodedQuotes = try? JSONDecoder().decode([Quote].self, from: quotesData){
                quoteLoadable = .loaded(decodedQuotes)
            }
        } catch {
            let error = ResponseHandler.shared.mapError(error)
            print("The error is: " + error.localizedDescription)
            
            quoteLoadable = .error(error)
        }
    }
    
    func changeIndex () {
        if quoteIndex < lengthQuote-1 {
            quoteIndex += 1
        } else {
            quoteIndex = 0
        }
    }
    
    func fetchQuotesIfNeeded() async {
        if let lastUpdate = userDefaults.object(forKey: "lastUpdate") as? Date {
            if userDefaults.object(forKey: "lastUpdate") == nil || lastUpdate.timeIntervalSinceNow < -24 * 60 * 60 {
                await getQuote()
            } else {
                return
            }
        }
    }
}
