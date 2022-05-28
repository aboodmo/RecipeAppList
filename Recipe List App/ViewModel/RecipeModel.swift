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
}
