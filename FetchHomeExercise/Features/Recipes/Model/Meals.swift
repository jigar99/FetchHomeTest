//
//  Meals.swift
//  FetchHomeExercise
//
//  Created by Jigar on 9/18/24.
//

import Foundation

// MARK: - Meals
struct Meals: Codable {
    let meals: [Meal]
}

// MARK: - Meal
struct Meal: Codable, Hashable {
    let strMeal, strMealThumb, idMeal: String
    
    let strDrinkAlternate: String?
    let strCategory, strArea, strInstructions: String?
    let strTags, strYoutube, strIngredient1, strIngredient2: String?
    let strIngredient3, strIngredient4, strIngredient5, strIngredient6: String?
    let strIngredient7, strIngredient8, strIngredient9, strIngredient10: String?
    let strIngredient11, strIngredient12, strIngredient13, strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16, strIngredient17, strIngredient18, strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1, strMeasure2, strMeasure3, strMeasure4: String?
    let strMeasure5, strMeasure6, strMeasure7: String?
    let strMeasure8, strMeasure9, strMeasure10: String?
    let strMeasure11, strMeasure12, strMeasure13: String?
    let strMeasure14, strMeasure15, strMeasure16: String?
    let strMeasure17, strMeasure18, strMeasure19: String?
    let strMeasure20: String?
    let strCreativeCommonsConfirmed, dateModified: String?
    
    
    // Computed property to ingredientsDictionary
    var ingredientsDictionary: [String: String] {
        let ingredients = [
            strIngredient1, strIngredient2, strIngredient3,
            strIngredient4, strIngredient5, strIngredient6,
            strIngredient7, strIngredient8, strIngredient9,
            strIngredient10, strIngredient11,  strIngredient12,
            strIngredient13,  strIngredient14,  strIngredient15,
            strIngredient16, strIngredient17,  strIngredient18,
            strIngredient19,  strIngredient20
        ].compactMap { $0 } // Remove nils
        
        let measures = [
            strMeasure1, strMeasure2, strMeasure3,
            strMeasure4, strMeasure5, strMeasure6,
            strMeasure7, strMeasure8, strMeasure9,
            strMeasure10, strMeasure11, strMeasure12, strMeasure13,
            strMeasure14, strMeasure15, strMeasure16,
            strMeasure17, strMeasure18, strMeasure19,
            strMeasure20
        ].compactMap { $0 } // Remove nils
        
        var dict: [String: String] = [:]
        for (index, ingredient) in ingredients.enumerated() {
            if index < measures.count {
                dict[ingredient] = measures[index]
            }
        }
        return dict
    }
}
