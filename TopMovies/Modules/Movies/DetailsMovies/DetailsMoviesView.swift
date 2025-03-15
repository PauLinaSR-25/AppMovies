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
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.imgLogo
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Titulo"
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "⭐️ Rating: \(0.0)"
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Descripcion: ..."
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.text = "📅 Fecha de lanzamiento: \("25/12/1998")"
        label.textAlignment = .center
        return label
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

extension DetailsMoviesView {
    private func setup() {
        backgroundColor = .appScreenBackground
        
        let stackView = UIStackView(arrangedSubviews: [posterImageView, titleLabel, ratingLabel, descriptionLabel, releaseDateLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            stackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9),
            
            posterImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.26),
            posterImageView.widthAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    func setDetails(data: DetailsMovieEntity) {
        titleLabel.text = data.title
        ratingLabel.text = "⭐️ Rating: \(data.rating)"
        descriptionLabel.text = data.description
        releaseDateLabel.text = "📅 Fecha de lanzamiento: \(data.releaseDate)"
        
        guard let img = data.poster else { return }
        
        if let url = URL(string: img) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.posterImageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}

