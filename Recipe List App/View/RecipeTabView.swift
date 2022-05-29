//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Abdelrahman Mohammad on 5/28/22.
//

import SwiftUI

struct RecipeTabView: View {
        
    var body: some View {
        TabView {
            FeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
                .tag(0)
            
            ContentView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("Recipes")
                    }
                }
        }.environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
