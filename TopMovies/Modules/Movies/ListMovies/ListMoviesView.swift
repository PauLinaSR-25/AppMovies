//
//  ListMoviesView.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//
//

import UIKit

final class ListMoviesView: UIView {
    //MARK: - Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let logOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cerrar sesión", for: .normal)
        button.backgroundColor = .appElement
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font =  UIFont.fontButtons()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - init
    init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListMoviesView {
    private func setup() {
        backgroundColor = .appScreenBackground
        
        addSubview(tableView)
        addSubview(logOutButton)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: logOutButton.topAnchor, constant: -8),
            
            logOutButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logOutButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: ExecutionDevice.detectDevice() == .iPad ? 0.6 : 0.8),
            logOutButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40),
        ])
    }
}

extension ListMoviesView {
    func getTableView() -> UITableView {
        return tableView
    }
    
    func getLogOutButton() -> UIButton {
        logOutButton
    }
}

