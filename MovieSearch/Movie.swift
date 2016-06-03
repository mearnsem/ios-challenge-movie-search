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
    private let keyVoteAverage = "vote_average"
    private let keySummary = "summary"
    private let keyPosterPath = "poster_path"
    
    var title: String
    var vote_average: Double
    var summary: String
    var poster_path: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let title = dictionary[keyTitle] as? String, vote_average = dictionary[keyVoteAverage] as? Double, summary = dictionary[keySummary] as? String, poster_path = dictionary[keyPosterPath] as? String else {return nil}
        
        self.title = title
        self.vote_average = vote_average
        self.summary = summary
        self.poster_path = poster_path
    }
    
}