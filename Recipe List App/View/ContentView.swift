//
//  ContentView.swift
//  Recipe List App
//
//  Created by Abdelrahman Mohammad on 5/14/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        NavigationView{
            List(model.recipes) { r in
                
                NavigationLink {
                    RecipeDetialView(recipe: r)
                } label: {
                    HStack(alignment: .center, spacing: 20.0){
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .cornerRadius(5)
                        Text(r.name)
                            .font(.body)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                    }
                }
            }.navigationTitle("All Recipes")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
