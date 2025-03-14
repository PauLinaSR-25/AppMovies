//
//  AuthenticationInteractor.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//  
//

import Foundation

protocol AuthenticationInteractorInputProtocol: AnyObject {
    //Presenter -> Interactor
    var presenter: AuthenticationInteractorOutputProtocol? {get set}
}


protocol AuthenticationInteractorOutputProtocol: AnyObject {
    //Interactor->Presenter
}

class AuthenticationInteractor: AuthenticationInteractorInputProtocol {
    weak var presenter: AuthenticationInteractorOutputProtocol?
}
