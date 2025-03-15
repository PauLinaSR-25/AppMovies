//
//  LocalManager.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//

import Foundation

class MockManager {
    static var shared = MockManager()
    var runAppWithMock : Bool = true
    
    static func saveCredentials(with email: String) {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        UserDefaults.standard.set(email, forKey: "email")
    }
    
    static func checkLoginStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    static func logOutLogin() {
        UserDefaults.standard.removeObject(forKey: "isLoggedIn")
        UserDefaults.standard.removeObject(forKey: "email")
    }
}
