//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Abdelrahman Mohammad on 5/17/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init(){
        
        self.recipes = DataService.getLocalData()
        
    }
    
    static func getportion(ingredient: Ingredient, recipeServings: Int, TargetServingSize: Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholeNum = 0
        
        if ingredient.num != nil {
            denominator *= recipeServings
            numerator *= TargetServingSize
            
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            if numerator >= denominator {
                wholeNum = numerator / denominator
                portion += String(wholeNum)
                numerator %= denominator
            }
            
            if numerator > 0 {
                portion += wholeNum > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
            
        }
        
        if var unit = ingredient.unit {
            
            if wholeNum > 1 {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast()) + "s"
                }
                else{
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
//            portion += wholeNum > 1 ? "\(unit)s" : "\(unit)"
            return portion + unit
        }
        
        
        return portion
    }
}
