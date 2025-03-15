//
//  ListMoviesInteractor.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//
//

import Foundation

protocol ListMoviesInteractorInputProtocol: AnyObject {
    //Presenter -> Interactor
    var presenter: ListMoviesInteractorOutputProtocol? {get set}
    
    func getDataMovies()
    func selectItemMovie(with index: Int)
}


protocol ListMoviesInteractorOutputProtocol: AnyObject {
    //Interactor->Presenter
    func showError(with message: String)
    func setDataMovies(with data: [MovieEntity])
    func setIdMovie(value: Int)
}

class ListMoviesInteractor: ListMoviesInteractorInputProtocol {
    weak var presenter: ListMoviesInteractorOutputProtocol?
    
    private var movies: [MovieAPIEntity] = []
    
    func getDataMovies() {
        let movieService = MovieService()
        
        movieService.fetchTopRatedMovies { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let movies):
                print("List of movies:")
                print(movies)
                
                self.movies = movies
                
                let responseData = MovieArrayMapping.convert(movies)
                let data = Array(responseData.prefix(10))
                self.presenter?.setDataMovies(with: data)
            case .failure(let error):
                let message = MovieService.getErrorMessage(from: error)
                self.presenter?.showError(with: message)
            }
        }
    }
    
    func selectItemMovie(with index: Int) {
        let id = movies[index].id
        presenter?.setIdMovie(value: id)
    }
}
