//
//  RecipeInstructionResponse.swift
//  FridgeFeastFinder
//
//  Created by Katherine Davis on 2023-12-03.
//

import Foundation


struct RecipeInstructionResponse: Codable {
    struct RecipeData: Codable {
        let id: Int
        let title: String
        let image: String
        let servings: Int
        
        enum CodingKeys: String, CodingKey {
            case id, title, image, servings
        }
    }
    
    let recipe: RecipeData
}
