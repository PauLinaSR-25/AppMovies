//
//  UIFont+Extension.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//

import UIKit

extension UIFont {
    static func fontTitle() -> UIFont {
        switch ExecutionDevice.detectDevice() {
        case .iPad:
            return UIFont(name: "Avenir-Heavy", size: 40) ?? .boldSystemFont(ofSize: 40)
        default:
            return UIFont(name: "Avenir-Heavy", size: 24) ?? .boldSystemFont(ofSize: 24)
        }
    }
    
    static func fontButtons() -> UIFont {
        switch ExecutionDevice.detectDevice() {
        case .iPad:
            return UIFont(name: "Avenir-Heavy", size: 18) ?? .boldSystemFont(ofSize: 18)
        default:
            return UIFont(name: "Avenir-Heavy", size: 16) ?? .boldSystemFont(ofSize: 16)
        }
    }
    
    static func fontTitleCell() -> UIFont {
        switch ExecutionDevice.detectDevice() {
        case .iPad:
            return UIFont(name: "Avenir-Heavy", size: 18) ?? .boldSystemFont(ofSize: 18)
        default:
            return UIFont(name: "Avenir-Heavy", size: 16) ?? .boldSystemFont(ofSize: 16)
        }
    }
    
    static func fontRatingCell() -> UIFont {
        switch ExecutionDevice.detectDevice() {
        case .iPad:
            return UIFont(name: "Avenir-Heavy", size: 16) ?? .boldSystemFont(ofSize: 16)
        default:
            return UIFont(name: "Avenir-Heavy", size: 14) ?? .boldSystemFont(ofSize: 14)
        }
    }
}
