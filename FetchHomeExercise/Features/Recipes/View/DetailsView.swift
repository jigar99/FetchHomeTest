//
//  DetailsView.swift
//  FetchHomeExercise
//
//  Created by Jigar on 9/18/24.
//

import SwiftUI

//DessertDetails View
struct DetailsView: View {
    @StateObject var vm = RecipesViewModel()
    @State private var isLoading : Bool = true
    @State var title : String  = "Details"
    @State private var errorMessage: String? = nil
    var idMeal : String
    var body: some View {
        ScrollView {
            VStack {
                if isLoading {
                    ProgressView()
                } else if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center) // Center the error message
                        .padding()
                }
                else {
                    VStack {
                        AsyncImage(url: URL(string: vm.meal!.strMealThumb)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                            
                        } placeholder: {
                            ProgressView()
                            
                        }
                        .frame(height: 200)
                        
                        Text(vm.meal!.strMeal)
                            .bold()
                            .font(.title)
                            .padding(.bottom,8)
                        
                        IngredientView(meal: vm.meal!)
                    }
                    Spacer()
                    
                }
                
            }
        }.scrollIndicators(.hidden)
            .onAppear{
                Task{
                    await loadDetailsView()
                }
            }
    }
    
    func loadDetailsView() async {
        errorMessage = nil
        isLoading = true
        let queryParamter = ["i" : idMeal] //queryParamter
        await vm.fetchDetailsMeal(parameter: queryParamter)
        title = vm.meal?.strMeal ?? ""
        isLoading = false
        errorMessage = vm.errorDescription
    }
    
}

#Preview {
    DetailsView(idMeal: "53049")
    
}
