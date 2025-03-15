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
    
    func login(_ email: String?, _ password: String?)
}


protocol AuthenticationInteractorOutputProtocol: AnyObject {
    //Interactor->Presenter
    func showError(message: String)
    func navigateToListMovies()
}

class AuthenticationInteractor: AuthenticationInteractorInputProtocol {
    weak var presenter: AuthenticationInteractorOutputProtocol?
    
    func login(_ email: String?, _ password: String?) {
        guard let email, let password else {
            presenter?.showError(message: "Datos incompletos")
            return
        }
        
        self.presenter?.navigateToListMovies()
    }
}
