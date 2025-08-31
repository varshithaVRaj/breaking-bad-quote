//
//  Death.swift
//  BreakingBadApp
//
//  Created by Varshitha VRaj on 24/08/25.
//

import Foundation


struct Death: Decodable{

    var deathId: Int
    var character: String
    var image: String
    var cause: String
    var details: String
    var responsible: [String]
    var connected: [String]
    var lastWords: String
    var episode: Int
    var production: String
    
    
    
       enum CodingKeys: String, CodingKey {
           case deathId = "death_id"   // 👈 FIXED
           case character
           case image
           case cause
           case details
           case responsible
           case connected
           case lastWords = "last_words" // 👈 matches JSON
           case episode
           case production
       }
 
}
   
