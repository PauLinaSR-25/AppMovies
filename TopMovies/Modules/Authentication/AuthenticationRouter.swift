//
//  AuthenticationRouter.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//  
//

import UIKit

protocol AuthenticationRouterProtocol: AnyObject {
    func navigateToListMovies()
}

class AuthenticationRouter {
    weak var viewController: UIViewController?

    static func createModule()->UIViewController{

        let view = AuthenticationViewController()
        let interactor = AuthenticationInteractor()
        let router = AuthenticationRouter()
        
        let presenter = AuthenticationPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
}

extension AuthenticationRouter: AuthenticationRouterProtocol {
    func navigateToListMovies() {
        let vc = ListMoviesRouter.createModule()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
    
    
    

