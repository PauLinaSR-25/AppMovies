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
        guard let email, let password, !email.isEmpty, !password.isEmpty else {
            presenter?.showError(message: "Datos incompletos")
            return
        }
        
        guard isValidEmail(text: email) else {
            presenter?.showError(message: "Correo invalido")
            return
        }
        
        if (MockManager.shared.runAppWithMock && isUserValidMocks(with: email, with: password)) ||
            (!MockManager.shared.runAppWithMock && isUserValid(with: email, with: password)) {
            MockManager.saveCredentials(with: email)
            presenter?.navigateToListMovies()
            return
        }
        
        presenter?.showError(message: "Credenciales invalidas, intenta nuevamente")
    }
}

extension AuthenticationInteractor {
    private func isValidEmail(text: String) -> Bool {
        let emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: text)
    }
    
    private func isUserValidMocks(with email: String,with password: String) -> Bool {
        return email == "paulina@correo.com" && password == "prueba123"
    }
    
    private func isUserValid(with email: String,with password: String) -> Bool {
        return true
    }
}
