//
//  DetailsMoviesView.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//  
//

import UIKit

final class DetailsMoviesView: UIView {
    //MARK: - Properties
    
    //MARK: - init
    init() {
        super.init(frame: .zero)
       
        setup()
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailsMoviesView {
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

