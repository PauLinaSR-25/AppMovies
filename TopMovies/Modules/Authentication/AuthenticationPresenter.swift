//
//  AuthenticationPresenter.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//  
//

import Foundation

//Presenter
protocol AuthenticationPresenterProtocol: AnyObject {
    var interactor: AuthenticationInteractorInputProtocol? {get set}
    
    func login(email: String?, password: String?)
}

class AuthenticationPresenter {
    //MARK: Properties
    var interactor: AuthenticationInteractorInputProtocol?
    weak private var view: AuthenticationViewProtocol?
    private let router: AuthenticationRouterProtocol
    
    
    init(interface: AuthenticationViewProtocol, interactor: AuthenticationInteractorInputProtocol, router: AuthenticationRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension AuthenticationPresenter: AuthenticationPresenterProtocol {
    func login(email: String?, password: String?) {
        interactor?.login(email, password)
    }
}

extension AuthenticationPresenter: AuthenticationInteractorOutputProtocol {
    func showError(message: String) {
        view?.showAlert(with: message)
    }
    
    func navigateToListMovies() {
        router.navigateToListMovies()
    }
}
