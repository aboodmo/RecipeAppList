//
//  FeaturedView.swift
//  Recipe List App
//
//  Created by Abdelrahman Mohammad on 5/29/22.
//

import SwiftUI

struct FeaturedView: View {
    
    @EnvironmentObject var model: RecipeModel
    @State var isSelected = false
    @State var tabSelectedIndex = 0
    
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Featured Recipes:")
                .bold()
                .padding(.leading)
                .padding(.top, 40.0)
                .padding(.bottom, -10.0)
                .font(Font.custom("AvenirNext-DemiBold", size: 30))
                
            
            GeometryReader { geo in
                TabView(selection: $tabSelectedIndex) {
                    
                    ForEach (0..<model.recipes.count) { i in
                        if model.recipes[i].featured {
                            
                            Button {
                                self.isSelected = true
                            } label: {
                                // Rectangle Card
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    VStack(spacing: 0) {
                                        Image(model.recipes[i].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[i].name)
                                            .padding(5)
                                            .font(Font.custom("AvenirNext", size: 15))
//                                            .padding(.bottom, 5.0)
                                    }
                                    
                                }
                            }
                            .tag(i)
                            .sheet(isPresented: $isSelected, content: {
                                RecipeDetialView(recipe: model.recipes[i])
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y:5)
                            
                        }
                        
                    }
                    
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }.padding(.bottom, 0.0)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preperation Time:")
                    .font(Font.custom("AvenirNext-DemiBold", size: 16))
                
                Text(model.recipes[tabSelectedIndex].prepTime)
                    .padding(.leading)
                    .font(Font.custom("AvenirNext", size: 15))
                
                Text("Highlights:")
                    .font(Font.custom("AvenirNext-DemiBold", size: 16))
                
                RecipeHighlights(highlights: model.recipes[tabSelectedIndex].highlights)
                    .padding(.leading)
                
            }
            .padding([.leading, .bottom])
            
        }
        .onAppear {
            firstFeaturedIndex()
        }
        
        
    }
    
    func firstFeaturedIndex() {
        var index = model.recipes.firstIndex { Recipe in
            return Recipe.featured
        }
        
        tabSelectedIndex = index ?? 0
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
            .environmentObject(RecipeModel())
    }
}
