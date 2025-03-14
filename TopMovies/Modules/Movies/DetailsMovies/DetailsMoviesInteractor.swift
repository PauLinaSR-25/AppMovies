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
}


protocol DetailsMoviesInteractorOutputProtocol: AnyObject {
    //Interactor->Presenter
}

class DetailsMoviesInteractor: DetailsMoviesInteractorInputProtocol {
    weak var presenter: DetailsMoviesInteractorOutputProtocol?
    
}
