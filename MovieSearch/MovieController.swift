//
//  MovieController.swift
//  MovieSearch
//
//  Created by Emily Mearns on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController {
    
    static let baseUrl = "http://api.themoviedb.org/3/search/movie"
    static let apiKey = "a082ec5884683f5fba90f5d4a5b6a034"
    
    static func fetchMovies(searchTerm: String, completion: (movies: [Movie]) -> Void) {
        
        guard let url = NSURL(string: baseUrl) else {
            completion(movies: [])
            return
        }
        
        let urlParameters = ["api_key":"\(apiKey)", "query":"\(searchTerm)"]
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            guard let data = data,
                jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject],
                resultsArray = jsonDictionary["results"] as? [[String: AnyObject]] else {
                    completion(movies: [])
                    return
            }
            var movies = [Movie]()
            for resultDictionary in resultsArray {
                if let movie = Movie(dictionary: resultDictionary) {
                    movies.append(movie)
                }
            }
            let sortedMovies = movies.sort({$0.0.rating > $0.1.rating})
            
            completion(movies: sortedMovies)
            return
        }
    }
    
}