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

    }
}

extension AuthenticationViewController: AuthenticationViewProtocol {
    
}

