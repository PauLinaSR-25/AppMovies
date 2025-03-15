//
//  ListMoviesViewModel.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//  
//

import Foundation

struct MovieEntity {
    var title: String = "Sin titulo"
    var poster: String?
    var rating: Double = 0.0
}

struct MovieAPIEntity: Codable {
    let id: Int
    let title: String
    let posterPath: String?
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id, title
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}

struct MovieResponse: Decodable {
    let results: [MovieAPIEntity]
}
