//
//  DetailsMoviesViewController.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//  
//

import UIKit

protocol DetailsMoviesViewProtocol: AnyObject {
    var presenter: DetailsMoviesPresenterProtocol? {get set}
    
    func showAlert(with message: String)
    func reloadData()
}

class DetailsMoviesViewController: UIViewController {
    var presenter: DetailsMoviesPresenterProtocol?
    
    private let contentView: DetailsMoviesView = DetailsMoviesView()

    override func loadView() {
        super.loadView()
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalle de Pelicula"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        presenter?.getDetails()
    }
}

extension DetailsMoviesViewController: DetailsMoviesViewProtocol {
    func showAlert(with message: String) {
        BannerAlert.show(showSavedSuccessfully: false, message: message)
    }
    
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.contentView.setDetails(data: presenter?.setDetailsMovie() ?? DetailsMovieEntity())
        }
    }
}

