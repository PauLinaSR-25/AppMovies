//
//  ListMoviesViewController.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//  
//

import UIKit

protocol ListMoviesViewProtocol: AnyObject {
    var presenter: ListMoviesPresenterProtocol? {get set}
}

class ListMoviesViewController: UIViewController {
    var presenter: ListMoviesPresenterProtocol?
    
    private let contentView: ListMoviesView = ListMoviesView()

    override func loadView() {
        super.loadView()
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Peliculas"
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension ListMoviesViewController: ListMoviesViewProtocol {
    
}

