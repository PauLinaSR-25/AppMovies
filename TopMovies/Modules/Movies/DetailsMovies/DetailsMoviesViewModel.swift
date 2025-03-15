//
//  DetailsMoviesViewModel.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//  
//

import Foundation

struct DetailsMovieEntity {
    var title: String = "Sin titulo"
    var poster: String?
    var rating: Double = 0.0
    var description: String = "Descripción:"
    var releaseDate: String = "Fecha de lanzamiento:"
}


struct MovieDetailAPIEntity: Decodable {
    let title: String
    let overview: String
    let posterPath: String?
    let voteAverage: Double
    let releaseDate: String

    enum CodingKeys: String, CodingKey {
        case title,
             overview,
             voteAverage = "vote_average",
             releaseDate = "release_date",
             posterPath = "poster_path"
    }
}
