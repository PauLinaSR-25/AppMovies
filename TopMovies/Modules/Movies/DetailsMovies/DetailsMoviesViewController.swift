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

    }
}

extension DetailsMoviesViewController: DetailsMoviesViewProtocol {
    
}

