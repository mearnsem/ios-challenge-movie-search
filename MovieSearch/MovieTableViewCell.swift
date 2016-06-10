//
//  MovieTableViewCell.swift
//  MovieSearch
//
//  Created by Emily Mearns on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    func updateWithMovie(movie: Movie) {
        titleLabel.text = movie.title
        ratingLabel.text = "Rating: \(movie.rating)"
        summaryLabel.text = movie.summary
        
        imageController.imageForURL(movie.posterImage) { (image) in
            self.posterImageView.image = image
        }
    }

}
