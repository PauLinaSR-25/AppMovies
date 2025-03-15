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
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Iniciar sesión", for: .normal)
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

extension AuthenticationView {
    private func setup() {
        backgroundColor = .appScreenBackground
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(stackView)
        addSubview(loginButton)
        
        NSLayoutConstraint.activate([
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
            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor)
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
}

