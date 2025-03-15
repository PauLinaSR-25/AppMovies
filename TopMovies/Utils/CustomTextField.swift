//
//  CustomTextField.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//

import UIKit

enum TextFieldType {
    case email
    case password
}

class CustomTextField: UITextField {
    private let fieldType: TextFieldType
    var validation: ValidationStrategy!
    
    init(fieldType: TextFieldType) {
        self.fieldType = fieldType
        super.init(frame: .zero)
        
        setupDesing()
        delegate = self
        setupStrategy()
        
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidEndEditing), name: UITextField.textDidEndEditingNotification, object: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStrategy() {
        switch fieldType {
        case .email:
            validation = EmailValidation()
        case .password:
            validation = PasswordValidation()
        }
    }
    
    private func setupDesing() {
        focusEffect = .none
        textColor = .black
        textAlignment = .left
        layer.borderColor = UIColor.appElement.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 10
        backgroundColor = .white
        adjustsFontSizeToFitWidth = true
        
        let paddingViewLeft = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.height))
        leftView = paddingViewLeft
        leftViewMode = .always
        
        switch fieldType {
        case .email:
            keyboardType = .emailAddress
            autocapitalizationType = .none
        case .password:
            isSecureTextEntry = true
        }
    }
}

extension CustomTextField: UITextFieldDelegate {
    @objc private func textFieldDidEndEditing(notification: Notification) {
        guard let text else { return }
        
        let valid = validation.isValid(text: text)
        
        layer.borderColor =  valid ? UIColor.appSecondElement.cgColor : UIColor.appElement.cgColor
    }
}
