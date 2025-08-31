//
//  Quote.swift
//  BreakingBadApp
//
//  Created by Varshitha VRaj on 24/08/25.
//

import Foundation 

//struct Quote: Decodable {
//    
//        var quoteTd: Int
//        var quote: String
//        var character: String
//        var production: String
//        var episode: Int
//}
//

struct Quote: Decodable {
    var quoteId: Int
    var quote: String
    var character: String
    var production: String
    var episode: Int
    
    enum CodingKeys: String, CodingKey {
        case quoteId = "quote_id"  
        case quote
        case character
        case production
        case episode
    }
}
