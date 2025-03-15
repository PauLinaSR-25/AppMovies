//
//  MovieArrayMapping.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 15/03/25.
//

import Foundation

class MovieArrayMapping {
    static func convert(_ input: [MovieAPIEntity]) -> [MovieEntity] {
        return input.map {
            if let poster = $0.posterPath {
                return MovieEntity(title: $0.title, poster: "https://image.tmdb.org/t/p/w500\(poster)", rating: $0.voteAverage)
            } else {
                return MovieEntity(title: $0.title, rating: $0.voteAverage)
            }
        }
    }
    
    static func convert(_ input: MovieDetailAPIEntity) -> DetailsMovieEntity {
        if let poster = input.posterPath {
            return DetailsMovieEntity(title: input.title, poster: "https://image.tmdb.org/t/p/w500\(poster)", rating: input.voteAverage, description: input.overview, releaseDate: input.releaseDate)
        } else {
            return DetailsMovieEntity(title: input.title, rating: input.voteAverage, description: input.overview, releaseDate: input.releaseDate)
        }
    }
}//class
