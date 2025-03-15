//
//  ListMoviesPresenter.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//  
//

import Foundation

//Presenter
protocol ListMoviesPresenterProtocol: AnyObject {
    var interactor: ListMoviesInteractorInputProtocol? {get set}
    
    func getMovies()
    func getNumberOfMovies() -> Int
    func getMovieForIndex(_ index: Int) -> MovieEntity
    
    func selectItemMovie(index: Int)
    func logOut()
}

class ListMoviesPresenter {
    //MARK: Properties
    var interactor: ListMoviesInteractorInputProtocol?
    weak private var view: ListMoviesViewProtocol?
    private let router: ListMoviesRouterProtocol
    
    init(interface: ListMoviesViewProtocol, interactor: ListMoviesInteractorInputProtocol, router: ListMoviesRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    private var movies: [MovieEntity] = []
}

extension ListMoviesPresenter: ListMoviesPresenterProtocol {
    func getMovies() {
        interactor?.getDataMovies()
    }
    
    func getNumberOfMovies() -> Int {
        movies.count
    }
    
    func getMovieForIndex(_ index: Int) -> MovieEntity {
        movies[index]
    }
    
    func selectItemMovie(index: Int) {
        router.navigationToDetailsMovie(with: index)
    }
    
    func logOut() {
        router.navigationToLogin()
    }
}

extension ListMoviesPresenter: ListMoviesInteractorOutputProtocol {
    func showError(with message: String) {
        view?.showAlert(with: message)
    }
    
    func setDataMovies(with data: [MovieEntity]) {
        self.movies = data
        view?.reloadData()
    }
}
