//
//  RecipeDetialView.swift
//  Recipe List App
//
//  Created by Abdelrahman Mohammad on 5/25/22.
//

import SwiftUI

struct RecipeDetialView: View {
    
    var recipe: Recipe
    
    @State var selectedServingSize = 2
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading){
                
                // MARK: Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                // MARK: Recipe Title
                Text("All Recipes")
                    .font(.title)
                    .bold()
                
                // MARK: Picker
                VStack(alignment: .leading){
                    
                    Text("Select your serving size:")
                    
                    Picker("", selection: $selectedServingSize) {
                        
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                        
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 160)
                    
                }
                .padding()
                
                
                // MARK: Ingrediants
                VStack(alignment: .leading){
                    Text("Ingredients:")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("• " + RecipeModel.getportion(ingredient: item, recipeServings: recipe.servings, TargetServingSize: selectedServingSize) + " " + item.name.lowercased())
                            .padding(.leading, 20.0)
                            .padding(.bottom, 1.0)
                            
                    }
                        
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider().padding(.bottom)
                
                // MARK: Directions
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
            }.navigationBarHidden(true)
            
            
                
//            Text(recipe.name)
//                .font(.title2)
//                .fontWeight(.medium)
//            Text(recipe.cookTime)
//
//            Text(recipe.prepTime)
            
        }
    }
}

struct RecipeDetialView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        RecipeDetialView(recipe: model.recipes[0])

    }
}
