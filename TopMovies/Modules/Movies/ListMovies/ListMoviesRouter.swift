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
    func navigationToDetailsMovie(with index: Int)
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
    func navigationToDetailsMovie(with index: Int) {
        let vc = DetailsMoviesRouter.createModule(id: index)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigationToLogin() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
    
    
    

