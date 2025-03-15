//
//  ListMoviesRouter.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//  
//

import UIKit

protocol ListMoviesRouterProtocol: AnyObject {
    func navigationToLogin()
}

class ListMoviesRouter {
    weak var viewController: UIViewController?

    static func createModule()->UIViewController{

        let view = ListMoviesViewController()
        let interactor = ListMoviesInteractor()
        let router = ListMoviesRouter()
        
        let presenter = ListMoviesPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
}

extension ListMoviesRouter: ListMoviesRouterProtocol {
    func navigationToLogin() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
    
    
    

