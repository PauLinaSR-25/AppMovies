//
//  DetailsMoviesInteractor.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//  
//

import Foundation

protocol DetailsMoviesInteractorInputProtocol: AnyObject {
    //Presenter -> Interactor
    var presenter: DetailsMoviesInteractorOutputProtocol? {get set}
    
    func getDetails(with id: Int)
}


protocol DetailsMoviesInteractorOutputProtocol: AnyObject {
    //Interactor->Presenter
    func setDataDetails(with data: DetailsMovieEntity)
    func showError(with message: String)
}

class DetailsMoviesInteractor: DetailsMoviesInteractorInputProtocol {
    weak var presenter: DetailsMoviesInteractorOutputProtocol?
    
    
    func getDetails(with id: Int) {
        let movieService = MovieService()
        
        movieService.fetchDetailsMovie(movieID: id) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let movie):
                self.presenter?.setDataDetails(with: movie)
            case .failure(let error):
                let message = MovieService.getErrorMessage(from: error)
                self.presenter?.showError(with: message)
            }
        }
    }
}
