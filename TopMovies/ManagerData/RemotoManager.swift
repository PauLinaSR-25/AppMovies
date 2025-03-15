//
//  RemotoManager.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 15/03/25.
//

import Foundation

enum WebServiceError: Error {
    case unableToPerformRequest
    case unexpectedStatusCode
    case unexpectedNilData
    case failedToDecode
    case urlSessionFailed
}

class MovieService {
    private let apiKey = "3cf8d9e30d0ae143f0d74ec998fc22c3"
    private let baseURL = "https://api.themoviedb.org/3/movie/top_rated"
    
    func fetchTopRatedMovies(completion: @escaping (Result<[MovieEntity], WebServiceError>) -> Void) {
        guard var urlComponents = URLComponents(string: baseURL) else {
            completion(.failure(.unableToPerformRequest))
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: "es-MX"),
        ]
        
        guard let url = urlComponents.url else {
            print("Failed to url")
            completion(.failure(.unableToPerformRequest))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to load: \(error.localizedDescription)")
                completion(.failure(.unableToPerformRequest))
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                print("Error code, status: \(response.statusCode)")
                completion(.failure(.unexpectedStatusCode))
                return
            }
            
            guard let data = data else {
                print("No data returned")
                completion(.failure(.unexpectedNilData))
                return
            }
            
            do {
                let responseAPIMovies = try JSONDecoder().decode(MovieResponse.self, from: data)
                let responseData = MovieArrayMapping.convert(responseAPIMovies.results)
                completion(.success(responseData))
            } catch {
                completion(.failure(.failedToDecode))
            }
        }.resume()
    }
}
