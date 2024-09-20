//
//  ContentView.swift
//  FetchHomeExercise
//
//  Created by Jigar on 9/18/24.
//

import SwiftUI

struct RecipesView: View {
    
    @StateObject var vm = RecipesViewModel()
    @State private var isLoading : Bool = true
    @State private var errorMessage: String? = nil
    
    var body: some View {
        
        NavigationStack {
            VStack {
                if isLoading {
                    ProgressView()
                } else if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    List(vm.meals, id: \.idMeal){ meal in
                        
                        NavigationLink {
                            DetailsView(idMeal: meal.idMeal)
                        } label: {
                            HStack {
                                AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                } placeholder: {
                                    ProgressView()
                                    
                                }
                                .frame(height: 100)
                                
                                Text(meal.strMeal)
                                    .bold()
                                    .font(.title3)
                            }
                        }
                    }
                }
            }
            
            .onAppear{
                Task{
                    errorMessage = nil
                    isLoading = true
                    await vm.fetchMeals()
                    print(vm.meals)
                    isLoading = false
                    errorMessage = vm.errorDescription
                }
            }
            .navigationTitle("Dessert")
        }
    }
}

#Preview {
    RecipesView()
}
