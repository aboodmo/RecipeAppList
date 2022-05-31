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
                    .padding(.top, -50.0)
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                // MARK: Recipe Title
                Text(recipe.name)
                    .font(Font.custom("AvenirNext-DemiBold", size: 30))
                    .padding(.bottom, -5.0)
                    
                    
                
                // MARK: Picker
                VStack(alignment: .leading){
                    
                    Text("Select your serving size:")
                        .font(Font.custom("AvenirNext", size: 15))
                    
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
                        .font(Font.custom("AvenirNext-DemiBold", size: 16))
                        .padding(.bottom, 5.0)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("• " + RecipeModel.getportion(ingredient: item, recipeServings: recipe.servings, TargetServingSize: selectedServingSize) + " " + item.name.lowercased())
                            .padding(.leading, 20.0)
                            .padding(.bottom, 1.0)
                            .font(Font.custom("AvenirNext", size: 15))
                            
                    }
                        
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider().padding(.bottom)
                
                // MARK: Directions
                VStack(alignment: .leading){
                    Text("Directions:")
                        .font(Font.custom("AvenirNext-DemiBold", size: 16))
                        .padding(.bottom, 5.0)
                    
                    ForEach (0..<recipe.directions.count, id: \.self) { i in
                        Text(String(i+1) + ".  \(recipe.directions[i])")
                            .padding(.leading, 20.0)
                            .padding(.bottom, 5.0)
                            .font(Font.custom("AvenirNext", size: 15))
                            
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
            
        }
    }
}

struct RecipeDetialView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        RecipeDetialView(recipe: model.recipes[0])

    }
}
