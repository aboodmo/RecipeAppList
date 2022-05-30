//
//  ContentView.swift
//  Recipe List App
//
//  Created by Abdelrahman Mohammad on 5/14/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        NavigationView{
            
            VStack(alignment: .leading){
                Text("All Recipes")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 40.0)
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { r in
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
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    
                }
                
            }
            .navigationBarHidden(true)
            .padding(.leading)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
            .environmentObject(RecipeModel())
    }
}
