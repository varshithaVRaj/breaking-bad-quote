//
//  Char.swift
//  BreakingBadApp
//
//  Created by Varshitha VRaj on 24/08/25.
//


import Foundation


struct Char: Decodable{
    
    var characterId: Int
    var name: String
    var birthday: String
    var occupations: [String]
    var images: [String]
    var fullName: String
    var aliases: [String]
    var status: String
    var appearance: Appearance
    var portrayedBy: String
    var productions: [String]
    var death: Death?   // 👈 make optional, not always present
    
    enum CodingKeys: String, CodingKey {
        case characterId = "character_id"
        case name
        case birthday
        case occupations
        case images
        case fullName = "full_name"
        case aliases
        case status
        case appearance
        case portrayedBy = "portrayed_by"
        case productions
        case death // only if nested, otherwise remove
    }
    
    
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.characterId = try container.decode(Int.self, forKey: .characterId)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.birthday = try container.decode(String.self, forKey: .birthday)
//        self.occupations = try container.decode([String].self, forKey: .occupations)
//        self.images = try container.decode([String].self, forKey: .images)
//        self.fullName = try container.decode(String.self, forKey: .fullName)
//        self.aliases = try container.decode([String].self, forKey: .aliases)
//        self.status = try container.decode(String.self, forKey: .status)
//        //self.appearance = try container.decode(appearance.self, forKey: .appearance)
//        self.portrayedBy = try container.decode(String.self, forKey: .portrayedBy)
//        self.productions = try container.decode([String].self, forKey: .productions)
//        self.death = try Death(from: decoder)
//    }
}


//struct appearance: Decodable{
//    
//    var breakingBad: [Int]
//    var betterCallSaul: [Int]
//    var elCamino: [Int]
//    
//}


struct Appearance: Decodable {
    var breakingBad: [Int]
    var betterCallSaul: [Int]
    var elCamino: [Int]
    
    enum CodingKeys: String, CodingKey {
        case breakingBad = "breaking_bad"
        case betterCallSaul = "better_call_saul"
        case elCamino = "el_camino"
    }
}
