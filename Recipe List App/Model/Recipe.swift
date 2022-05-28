//
//  Recipe.swift
//  Recipe List App
//
//  Created by Abdelrahman Mohammad on 5/14/22.
//

import Foundation

class Recipe: Identifiable, Decodable {
    
    var id: UUID?
    
    var name: String
    var featured: Bool
    var image: String
    var description: String
    var prepTime: String
    var cookTime: String
    var totalTime: String
    var servings: Int
    var ingredients: [String]
    var directions: [String]
    
}
