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
    
}

extension ListMoviesPresenter: ListMoviesInteractorOutputProtocol {
    
}