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
}


protocol ListMoviesInteractorOutputProtocol: AnyObject {
    //Interactor->Presenter
    func showError(with message: String)
    func setDataMovies(with data: [MovieEntity])
}

class ListMoviesInteractor: ListMoviesInteractorInputProtocol {
    weak var presenter: ListMoviesInteractorOutputProtocol?
    
    private var movies: [MovieEntity] = []
    
    func getDataMovies() {
        let movieService = MovieService()
        
        movieService.fetchTopRatedMovies { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let movies):
                print("List of movies:")
                print(movies)
                let data = Array(movies.prefix(10))
                self.presenter?.setDataMovies(with: data)
            case .failure(let error):
                let message = getErrorMessage(from: error)
                self.presenter?.showError(with: message)
            }
        }
    }
    
    private func getErrorMessage(from error: WebServiceError) -> String {
        switch error {
        case .unableToPerformRequest, .urlSessionFailed:
            return "No se pudo realizar la solicitud"
        case .unexpectedNilData, .unexpectedStatusCode, .failedToDecode:
            return "Se recibieron datos inesperados"
        }
    }
}
