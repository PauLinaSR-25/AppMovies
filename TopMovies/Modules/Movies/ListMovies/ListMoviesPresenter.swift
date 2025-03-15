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
    
    func logOut()
    func getMovies() -> [Movie]
    func selectItemMovie(index: Int)
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
}

extension ListMoviesPresenter: ListMoviesPresenterProtocol {
    func getMovies() -> [Movie] {
        [
            Movie(title: "Inception", poster: "https://example.com/inception.jpg", rating: 8.8),
            Movie(title: "Titanic", poster: "https://example.com/titanic.jpg", rating: 7.8),
            Movie(title: "The Dark Knight", poster: "https://example.com/dark_knight.jpg", rating: 9.0),
        ]
    }
    
    func selectItemMovie(index: Int) {
        
    }
    
    func logOut() {
        router.navigationToLogin()
    }
}

extension ListMoviesPresenter: ListMoviesInteractorOutputProtocol {
    
}
