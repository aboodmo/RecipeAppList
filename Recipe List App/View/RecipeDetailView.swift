//
//  ContentView.swift
//  Recipe List App
//
//  Created by Abdelrahman Mohammad on 5/14/22.
//

import SwiftUI

struct RecipeDetialView: View {
    
    var body: some View {
        List(model.recipes) { r in
            
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
    }
}

struct RecipeDetialView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetialView(recipe: model.recipes[0])
    }
}
