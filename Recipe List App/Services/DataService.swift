//
//  DataService.swift
//  Recipe List App
//
//  Created by Abdelrahman Mohammad on 5/17/22.
//

import Foundation

class DataService {
    static func getLocalData() -> [Recipe] {
        // Parse local json file
        
        // Get url path to json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check that pathString is not nil

        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a json decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the UUID
                for r in recipeData {
                    r.id = UUID()
                }
                
                // Return the recipes
                return recipeData
            }
            catch{
                print(error)
            }
            
        }
        catch {
            print(error)
        }
        
        return [Recipe]()
        
    }
    
}
