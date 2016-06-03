//
//  Movie.swift
//  MovieSearch
//
//  Created by Emily Mearns on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class Movie {
    
    private let keyTitle = "title"
    private let keyRating = "rating"
    private let keySummary = "summary"
    private let keyImage = "image"
    
    var title: String
    var rating: Double
    var summary: String
    var image: UIImage
    
    init?(title: String, rating: Double, summary: String, image: UIImage) {
        self.title = title
        self.rating = rating
        self.summary = summary
        self.image = image
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let title = dictionary[keyTitle] as? String, rating = dictionary[keyRating] as? Double, summary = dictionary[keySummary] as? String, image = dictionary[keyImage] as? UIImage else {return nil}
        
        self.title = title
        self.rating = rating
        self.summary = summary
        self.image = image
    }
    
}