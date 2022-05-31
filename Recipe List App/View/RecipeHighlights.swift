//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Abdelrahman Mohammad on 5/30/22.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights: [String]){
        
        for i in 0..<highlights.count {
            if i == highlights.count - 1 {
                allHighlights += highlights[i]
            }else{
                allHighlights += highlights[i] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
            .font(Font.custom("AvenirNext", size: 15))
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test1", "test2", "test3"])
    }
}
