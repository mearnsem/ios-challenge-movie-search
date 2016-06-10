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
        
        ImageController.imageForURL(movie.posterImage) { (image) in
            self.posterImageView.image = image
            
        }
        
    }
    
//    func getFrameSizeForImage(image: UIImage, inImageView: UIImageView) -> CGRect {
//        guard let width = imageView?.frame.size.width, height = imageView?.frame.size.height else {return CGRect()}
//        
//        let widthRatio = image.size.width / width
//        let heightRatio = image.size.height / height
//        let scale = max(widthRatio, heightRatio)
//        let newImageWidth = image.size.width / scale
//        let newImageHeight = image.size.height / scale
//        let leftOffSet = (width - newImageWidth) / 2
//        let topOffSet = (height - newImageHeight) / 2
//        return CGRectMake(leftOffSet, topOffSet, newImageWidth, newImageHeight)
//    }

}
