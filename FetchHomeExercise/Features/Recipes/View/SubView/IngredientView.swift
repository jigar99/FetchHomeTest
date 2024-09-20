//
//  IngredientView.swift
//  FetchHomeExercise
//
//  Created by Jigar on 9/19/24.
//

import SwiftUI

struct IngredientView: View {
    var meal: Meal
    var body: some View {
        VStack(alignment:.leading) {
            
            Text("Ingredient:")
                .font(.title3)
                .padding(.bottom,8)
            
            ForEach(meal.ingredientsDictionary.sorted(by: { $0.key < $1.key }), id: \.key) { ingredient, measure in
                if !measure.isEmpty && !ingredient.isEmpty {
                    Text("\(measure) of \(ingredient)")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
            }
            .padding(.bottom,8)
            
            
            Text("Follow instructions to make \(meal.strMeal):")
                .font(.title3)
                .padding(.bottom,8)
            
            Text(meal.strInstructions ?? "")
                .font(.subheadline)
            
            
        }
        .padding()
    }
}


