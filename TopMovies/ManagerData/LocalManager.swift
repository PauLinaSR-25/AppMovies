//
//  LocalManager.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//

import Foundation

enum LocalEndpoint: String {
    case client = "client"
}

class LocalManager {
    static var shared = LocalManager()
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
        LocalManager.authUser = nil
    }
    
    static var authUser: [MovieAPIEntity]?{
        set{
            let defaults=UserDefaults.standard
            do{
                let encoder = JSONEncoder()
                let encodeData = try encoder.encode(newValue)
                defaults.set(encodeData, forKey:  LocalEndpoint.client.rawValue)
            }catch{
                debugPrint(error,separator: "-",terminator: ".")
            }
        }
        get{
            if let data = UserDefaults.standard.data(forKey: LocalEndpoint.client.rawValue) {
                do{
                    let decoder = JSONDecoder()
                    let dataModel: [MovieAPIEntity] = try decoder.decode([MovieAPIEntity].self, from: data)
                    return dataModel
                }catch{
                    return nil
                }
                
            }
            return nil
            
        }
    }
}
