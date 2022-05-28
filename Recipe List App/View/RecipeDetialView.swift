//
//  RecipeDetialView.swift
//  Recipe List App
//
//  Created by Abdelrahman Mohammad on 5/25/22.
//

import SwiftUI

struct RecipeDetialView: View {
    
    var recipe: Recipe
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading){
                
                // Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                // Ingrediants
                VStack(alignment: .leading){
                    Text("Ingredients:")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    
                    ForEach (recipe.ingredients, id: \.self) { item in
                        Text("• " + item)
                            .padding(.leading, 20.0)
                            .padding(.bottom, 1.0)
                            
                    }
                        
                }
                .padding(.horizontal)
                
                Divider().padding(.bottom)
                
                // Directions
                VStack(alignment: .leading){
                    Text("Directions:")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    
                    ForEach (0..<recipe.directions.count, id: \.self) { i in
                        Text(String(i+1) + ".  \(recipe.directions[i])")
                            .padding(.leading, 20.0)
                            .padding(.bottom, 5.0)
                            
                    }
                        
                }
                .padding(.horizontal)
                
                Divider().padding(.bottom)
            }
            
            
                
//            Text(recipe.name)
//                .font(.title2)
//                .fontWeight(.medium)
//            Text(recipe.cookTime)
//
//            Text(recipe.prepTime)
            
        }.navigationBarTitle(recipe.name)
    }
}

struct RecipeDetialView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        RecipeDetialView(recipe: model.recipes[0])

    }
}
