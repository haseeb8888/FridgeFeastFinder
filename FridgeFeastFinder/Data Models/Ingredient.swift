//
//  Ingredient.swift
//  FridgeFeastFinder
//
//  Created by Katherine Davis on 2023-11-30.
//

import Foundation

struct Ingredient: Codable {
    let name: String
    let image: String
    let id: Int
    let aisle: String
    let possibleUnits: [String]
    
    //additional parameters:
    
    let query: String?
    let number: Int?
    let language: String?
    let metaInformation: Bool?
    let intolerances: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case image
        case id
        case aisle
        case possibleUnits = "possibleUnits"
        
        case query
        case number
        case language
        case metaInformation
        case intolerances
    }
}
