//
//  Movie.swift
//  MovieSearch
//
//  Created by Emily Mearns on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Movie {
    
    let title: String
    let rating: Int
    let summary: String
    let posterImage: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let title = dictionary["title"] as? String, rating = dictionary["vote_average"] as? Int, summary = dictionary["overview"] as? String, posterImage = dictionary["poster_path"] as? String else {return nil}
        
        self.title = title
        self.rating = rating
        self.summary = summary
        self.posterImage = posterImage
    }
    
}