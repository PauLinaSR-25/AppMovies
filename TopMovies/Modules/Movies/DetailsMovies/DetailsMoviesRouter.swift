//
//  DetailsMoviesRouter.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//  
//

import UIKit

protocol DetailsMoviesRouterProtocol: AnyObject {
    
}

class DetailsMoviesRouter {
    weak var viewController: UIViewController?

    static func createModule()->UIViewController{

        let view = DetailsMoviesViewController()

        let interactor = DetailsMoviesInteractor()
        let router = DetailsMoviesRouter()
        
        let presenter = DetailsMoviesPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
}

extension DetailsMoviesRouter: DetailsMoviesRouterProtocol {
    
}
    
    
    

