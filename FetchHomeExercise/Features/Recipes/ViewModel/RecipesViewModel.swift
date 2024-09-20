//
//  RecipesViewModel.swift
//  FetchHomeExercise
//
//  Created by Jigar on 9/18/24.
//

import Foundation

// ViewModel for handling recipe data and interactions
class RecipesViewModel : ObservableObject {
    
    // Published properties to notify the UI of changes
    @Published var meals: [Meal] = []          // Array of meals to be displayed
    @Published var meal: Meal?                  // Selected meal details
    var errorDescription: String?          // Error message to display in UI
    
    // Fetch the list of meals in the Dessert category
    @MainActor
    func fetchMeals() async {
        
        let parameter = ["c" : "Dessert"]       // QueryParamter hard core value, (we use Endpoint enum for genrics)
        
        let result = await NetworkManager.shared.request(type: Meals.self, url: API.dessert,parameter: parameter)
        switch result {
        case .success(let data):
            meals = data.meals.compactMap({$0})          //Remove all the nulls values
                .sorted(by: { $0.strMeal < $1.strMeal}) //Sorted by alphabetically using strMeal
        case .failure(let error):
            // Capture error description if the request fails
            errorDescription = error.description
        }
    }
    
    // Fetch the details of a specific meal by its ID
    @MainActor
    func fetchDetailsMeal(parameter : [String: Any]) async {
        
        let result = await NetworkManager.shared.request(type: Meals.self, url: API.mealDetail,parameter: parameter)
        switch result {
        case .success(let data):
            if let meal =  data.meals.first {
                self.meal = meal
                
            } else {
                errorDescription = NetworkManager.NetworkError.error.description
            }
        case .failure(let error):
            // Capture error description if the request fails
            errorDescription = error.description
        }
    }
}
