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
    
}

extension AuthenticationPresenter: AuthenticationInteractorOutputProtocol {
    
}