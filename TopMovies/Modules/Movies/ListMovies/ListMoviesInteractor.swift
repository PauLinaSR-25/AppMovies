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
}


protocol ListMoviesInteractorOutputProtocol: AnyObject {
    //Interactor->Presenter
}

class ListMoviesInteractor: ListMoviesInteractorInputProtocol {
    weak var presenter: ListMoviesInteractorOutputProtocol?
}
