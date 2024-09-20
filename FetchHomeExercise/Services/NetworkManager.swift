//
//  NetworkManager.swift
//  FetchHomeExercise
//
//  Created by Jigar on 9/18/24.
//

import Foundation


// Generic network manager for handling API request
class NetworkManager {
    
    static let shared = NetworkManager()
    
    func request<T:Decodable>(type : T.Type, url : String, parameter: [String: Any] = [:]) async -> Result<T, NetworkError> {
        
        var url = URL(string: url)
        
        // If there are parameters, append them as query items to the URL
        if !parameter.isEmpty {
            let requestQuery =   parameter.compactMap { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
            url?.append(queryItems: requestQuery)
        }
        
        // Ensure the URL is valid; return an error if not
        guard let url  else {
            return .failure(.invalidURL)
        }
        
        if let (data, response) = try? await URLSession.shared.data(from: url) {
            
            // Check if the response is an HTTP response and has a status code of 200 (OK)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                let statusCode = (response as! HTTPURLResponse).statusCode
                
                return  .failure(.invalidStatusCode(statusCode: statusCode))
            }
            
            do {
                // Decode the JSON response into the specified typ
                let decode = JSONDecoder()
                let res = try decode.decode(T.self, from: data)
                return .success(res)
                
            } catch {
                // Handle JSON decoding errors
                return .failure(.failedToDecode(error:error))
            }
        } else {
            // Handle unexpected errors during the network call
            return .failure(.error)
        }
    }
}

extension NetworkManager {
    
    enum NetworkError : Error {
        case invalidURL
        case custom(error: Error)
        case invalidStatusCode(statusCode: Int)
        case error
        case failedToDecode(error: Error)
    }
    
}

extension NetworkManager.NetworkError {
    
    // Description of each network error for user-friendly messages
    var description: String {
        
        switch self {
        case .invalidURL:
            return "The provided URL is invalid."
        case .custom(let error):
            return "An error occurred: \(error.localizedDescription)"
        case .invalidStatusCode(let statusCode):
            return "Received an invalid status code: \(statusCode)."
        case .error:
            return "An unexpected error occurred. Please try again."
        case .failedToDecode(let error):
            return "Failed to decode the response: \(error.localizedDescription)."
        }
        
    }
    
}
