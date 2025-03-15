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
    
    func showAlert(with message: String)
    func reloadData()
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
        title = "Listado de Top de Peliculas"
        self.navigationItem.hidesBackButton = true
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        contentView.getLogOutButton().addTarget(self, action: #selector(didTapLogOut), for: .touchUpInside)
        contentView.getTableView().dataSource = self
        contentView.getTableView().delegate = self
        
        presenter?.getMovies()
    }
    
    @objc private func didTapLogOut() {
        presenter?.logOut()
    }
}

extension ListMoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNumberOfMovies() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.configure(with: MovieEntity(title: "Titulo", poster: "https://example.com/inception.jpg", rating: 7.5))
        
        let movie = presenter?.getMovieForIndex(indexPath.row)
        cell.configure(with: movie ?? MovieEntity())
        
        return cell
    }
}

extension ListMoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.selectItemMovie(index: indexPath.row)
    }
}

extension ListMoviesViewController: ListMoviesViewProtocol {
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.contentView.getTableView().reloadData()
        }
    }
    
    func showAlert(with message: String) {
        BannerAlert.show(showSavedSuccessfully: false, message: message)
    }
}

