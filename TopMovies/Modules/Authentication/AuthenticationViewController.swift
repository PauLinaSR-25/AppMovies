//
//  AuthenticationViewController.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//  
//

import UIKit

protocol AuthenticationViewProtocol: AnyObject {
    var presenter: AuthenticationPresenterProtocol? {get set}
    
    func showAlert(with message: String)
}

class AuthenticationViewController: UIViewController {
    var presenter: AuthenticationPresenterProtocol?
    
    private let contentView: AuthenticationView = AuthenticationView()

    override func loadView() {
        super.loadView()
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        contentView.loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
    }
    
    @objc private func didTapLogin() {
        print("Loading login...")
        presenter?.login(email: contentView.getEmail(), password: contentView.getPassword())
    }
}

extension AuthenticationViewController: AuthenticationViewProtocol {
    func showAlert(with message: String) {
        BannerAlert.show(showSavedSuccessfully: false, length: .short, message: message)
    }
}

