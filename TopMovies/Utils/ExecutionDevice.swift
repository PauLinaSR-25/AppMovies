//
//  Device.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//

import UIKit

enum ExecutionDevice {
    case Mac
    case iPad
    case Other
    
    static func detectDevice() -> ExecutionDevice {
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            return ExecutionDevice.iPad
//        case .mac:
//            return ExecutionDevice.Mac
        default:
            return ExecutionDevice.Other
        }
    }
}
