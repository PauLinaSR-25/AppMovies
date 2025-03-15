//
//  AuthenticationView.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//
//

import UIKit

final class AuthenticationView: UIView {
    //MARK: - Properties
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "movieclapper")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.tintColor = .darkGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Inicio de sesión"
        label.font = UIFont.fontTitle()
        label.textAlignment = .center
        label.textColor = .appSecondElement
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: CustomTextField = {
        let textField = CustomTextField(fieldType: .email)
        textField.placeholder = "Correo electrónico"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: CustomTextField = {
        let textField = CustomTextField(fieldType: .password)
        textField.placeholder = "Contraseña"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Iniciar sesión", for: .normal)
        button.backgroundColor = .appElement
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font =  UIFont.fontButtons()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let bdMoviesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.imgBD
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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

extension AuthenticationView {
    private func setup() {
        backgroundColor = .appScreenBackground
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(headerImageView)
        addSubview(titleLabel)
        addSubview(stackView)
        addSubview(loginButton)
        addSubview(bdMoviesImageView)
        
        NSLayoutConstraint.activate([
            headerImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            headerImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: ExecutionDevice.detectDevice() == .iPad ? 0.16 : 0.38),
            headerImageView.heightAnchor.constraint(equalTo: headerImageView.widthAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -60),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: ExecutionDevice.detectDevice() == .iPad ? 0.5 : 1.0),
            
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: ExecutionDevice.detectDevice() == .iPad ? 0.6 : 0.8),
            
            emailTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.055),
            
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: ExecutionDevice.detectDevice() == .iPad ? 0.6 : 0.8),
            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            bdMoviesImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bdMoviesImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: ExecutionDevice.detectDevice() == .iPad ? 0.4 : 0.6),
            bdMoviesImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            bdMoviesImageView.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}

extension AuthenticationView {
    func getEmail() -> String? {
        emailTextField.text
    }
    
    func getPassword() -> String? {
        passwordTextField.text
    }
    
    func getLoginButton() -> UIButton {
        loginButton
    }
    
    func startRotating() {
        UIView.animate(withDuration: 2.0,
                       delay: 0.8,
                       options: [.repeat, .curveLinear],
                       animations: {
            self.headerImageView.transform = self.headerImageView.transform.rotated(by: .pi)
        },
                       completion: nil)
    }
}

