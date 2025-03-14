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
}

extension DetailsMoviesPresenter: DetailsMoviesPresenterProtocol {
    
}

extension DetailsMoviesPresenter: DetailsMoviesInteractorOutputProtocol {
    
}