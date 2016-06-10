//
//  MovieController.swift
//  MovieSearch
//
//  Created by Emily Mearns on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController {
    
    static let baseUrl = "http://api.themoviedb.org/3"
    static let apiKey = "a082ec5884683f5fba90f5d4a5b6a034"
    static let movieSearchString = MovieController.baseUrl + "/search/movie"
    
    static func fetchMovies(searchTerm: String, completion: () -> Void) {
        
        guard let url = NSURL(string: movieSearchString) else {return}
        
        let urlParameters = ""
        

    }
    
}