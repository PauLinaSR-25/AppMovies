//
//  MovieCell.swift
//  TopMovies
//
//  Created by Paulina Sanchez Salazar on 14/03/25.
//

import UIKit

class MovieCell: UITableViewCell {
    private let posterImageView:  UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "popcorn.circle.fill")
        imageView.tintColor = .appSecondElement
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel:  UILabel = {
        let label = UILabel()
        label.font = UIFont.fontTitleCell()
        label.text = "Titulo"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingLabel:  UILabel = {
        let label = UILabel()
        label.font = UIFont.fontRatingCell()
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .clear
        
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(ratingLabel)
        
        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            posterImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            posterImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            posterImageView.widthAnchor.constraint(equalTo: posterImageView.heightAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            ratingLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 15),
            ratingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            ratingLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            ratingLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with movie: MovieEntity) {
        titleLabel.text = movie.title
        ratingLabel.text = "Rating: ⭐️ \(movie.rating)"
        
        guard let img = movie.poster else { return }
        
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


