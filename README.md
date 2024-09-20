# FetchHomeTest
A native iOS application that allows users to browse and view detailed recipes for desserts using the MealDB API. Built with Swift and SwiftUI, this app demonstrates the use of modern Swift features like async/await for asynchronous 



## Overview

This is a native iOS app that allows users to browse recipes using the MealDB API. The app fetches a list of meals in the Dessert category and displays them to the user. When a meal is selected, detailed information about the meal is shown.

## Features

- Fetches a list of desserts from the MealDB API.
- Displays meals sorted alphabetically.
- Provides detailed information for each meal, including:
  - Meal name
  - Instructions
  - Ingredients and measurements
- Built using Swift Concurrency (async/await) for asynchronous operations.
- User-friendly interface designed with SwiftUI.

## API Endpoints

The following API endpoints are utilized in this app:

1. **Dessert Meals List**: 
   - `https://themealdb.com/api/json/v1/1/filter.php?c=Dessert`

2. **Meal Details by ID**: 
   - `https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID`

## Requirements

- Xcode (latest version)
- Swift (latest version)

## Implementation Details

- All asynchronous code is implemented using Swift Concurrency (`async/await`).
- Null or empty values are filtered out before displaying data.

## Setup

To run this project locally:

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/Fetch-iOS-Coding-Challenge.git
