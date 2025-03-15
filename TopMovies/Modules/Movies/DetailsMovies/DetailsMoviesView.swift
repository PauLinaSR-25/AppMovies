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
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Titulo"
        label.font = UIFont.fontTitle()
        label.textAlignment = .center
        label.textColor = .appSecondElement
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.fontCaptions()
        label.text = "⭐️ Rating: \(0.0)"
        label.textAlignment = .center
        label.textColor = .appElement
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.fontBody()
        label.text = "Descripcion: ..."
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.fontCaptions()
        label.text = "📅 Fecha de lanzamiento: \("25/12/1998")"
        label.textAlignment = .left
        label.textColor = .appElement
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
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, ratingLabel, descriptionLabel, releaseDateLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(posterImageView)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            posterImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            posterImageView.widthAnchor.constraint(equalTo: posterImageView.heightAnchor, multiplier: 0.64),
            posterImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            stackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            stackView.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 12)
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

