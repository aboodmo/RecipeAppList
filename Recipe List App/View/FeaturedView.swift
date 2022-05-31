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
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Featured Recipes")
                .font(.largeTitle)
                .bold()
                .padding(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .padding(.top, 40.0)
                
            
            GeometryReader { geo in
                TabView {
                    
                    ForEach (0..<model.recipes.count) { i in
                        if model.recipes[i].featured {
                            
                            Button {
                                self.isSelected = true
                            } label: {
                                // Rectangle Card
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    VStack {
                                        Image(model.recipes[i].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[i].name)
                                            .fontWeight(.medium)
                                            .padding(5)
                                    }
                                    
                                }
                            }
                            .sheet(isPresented: $isSelected, content: {
                                RecipeDetialView(recipe: model.recipes[i])
                            })
                            .buttonStyle(.plain)
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.556), radius: 10, x: -5, y:5)
                            
                        }
                        
                    }
                    
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                
            }.padding(.bottom, 10.0)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preperation Time:")
                    .font(.headline)
                Text("1 hour")
                    .padding(.leading)
                Text("Highlights:")
                    .font(.headline)
                Text("Preperation Time")
                    .padding(.leading)
            }
            .padding([.leading, .bottom])
            
        }
        
        
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
            .environmentObject(RecipeModel())
    }
}
