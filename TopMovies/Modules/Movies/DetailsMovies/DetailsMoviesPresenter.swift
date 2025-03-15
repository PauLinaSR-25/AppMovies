//
//  DetailsMoviesPresenter.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//  
//

import Foundation

//Presenter
protocol DetailsMoviesPresenterProtocol: AnyObject {
    var interactor: DetailsMoviesInteractorInputProtocol? {get set}
    
    func getDetails()
    func setDetailsMovie() -> DetailsMovieEntity
}

class DetailsMoviesPresenter {
    //MARK: Properties
    var interactor: DetailsMoviesInteractorInputProtocol?
    weak private var view: DetailsMoviesViewProtocol?
    private let router: DetailsMoviesRouterProtocol
    
    
    init(interface: DetailsMoviesViewProtocol, interactor: DetailsMoviesInteractorInputProtocol, router: DetailsMoviesRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    var id: Int = 0
    var movieDetails = DetailsMovieEntity()
}

extension DetailsMoviesPresenter: DetailsMoviesPresenterProtocol {
    func setDetailsMovie() -> DetailsMovieEntity {
        movieDetails
    }
    
    func getDetails() {
        interactor?.getDetails(with: self.id)
    }
}

extension DetailsMoviesPresenter: DetailsMoviesInteractorOutputProtocol {
    func setDataDetails(with data: DetailsMovieEntity) {
        movieDetails = data
        view?.reloadData()
    }
    
    func showError(with message: String) {
        view?.showAlert(with: message)
    }
}
