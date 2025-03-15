//
//  ValidationTextField.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//

import Foundation

protocol ValidationStrategy {
    func isValid(text: String) -> Bool
}

extension ValidationStrategy {
    func isValid(text: String) -> Bool {
        let valid = text != "" && !text.isEmpty && text.count > 0
        return valid
    }
}

class EmailValidation: ValidationStrategy {
    func isValid(text: String) -> Bool {
        let emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: text)
    }
}

class PasswordValidation: ValidationStrategy {}
