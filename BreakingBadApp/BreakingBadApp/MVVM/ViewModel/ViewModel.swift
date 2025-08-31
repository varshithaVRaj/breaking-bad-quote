//
//  ViewModel.swift
//  BreakingBadApp
//
//  Created by Varshitha VRaj on 24/08/25.
//

import SwiftUI
import Foundation

class ViewModel {
    
    enum fetchStatus{
        case notStarted
        case fetching
        case success
        case failed(error: Error)
    }
    
    private (set) var status: fetchStatus = .notStarted
    private let fetcher = FetchService()
    
    var quote: Quote?
    var charcter: Char?
    
//    init(){
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        let quoteData = try! Data(contentsOf: Bundle.main.url(forResource: "samplequote", withExtension: "json")!)
//        let characterData = try! Data(contentsOf: Bundle.main.url(forResource: "sampleCharacter", withExtension: "json")!)
//        charcter = try! decoder.decode(Char.self, from: characterData)
//    }
    
    init() {
        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        if let quoteURL = Bundle.main.url(forResource: "samplequote", withExtension: "json"),
           let characterURL = Bundle.main.url(forResource: "samplecharacter", withExtension: "json") {
            do {
                let characterData = try Data(contentsOf: characterURL)
                charcter = try decoder.decode(Char.self, from: characterData)
                print("the charcter is fetched: \(String(describing: charcter)) ")
                
                let quoteData = try Data(contentsOf: quoteURL)
                quote = try decoder.decode(Quote.self, from: quoteData)
                print("quote is fecthed:- \(String(describing: quote))")
                
            } catch {
                print("Error decoding sample data in init of view model : \(error)")
            }
        } else {
            print("Sample JSON not found in bundle.")
        }
    }

    
    func getData(for show: String) async {
        self.status = .fetching
        
        do{
            quote = try await fetcher.fetchQuote(from: show)
            charcter = try await fetcher.fetchCharacters(quote!.character)
            
            if let name = charcter?.name{
//                charcter?.death = try await fetcher.fetchDeath(for: name)
                if let death = try await fetcher.fetchDeath(for: name){
                    charcter?.death = death
                }
            }
            
            status = .success
            
       //MARK: START FROM LESSON (9) VIDEO (56) OF UDEMY
            
        }catch {
            
            print("Error decoding sample data in get data funciton : \(error)")
            
        }
    }
    
    
}

