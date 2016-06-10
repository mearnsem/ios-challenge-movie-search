//
//  MovieController.swift
//  MovieSearch
//
//  Created by Emily Mearns on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController {
    
    let baseUrl = NSURL(string: "http://api.themoviedb.org/3/search/movie?api_key=f83783c7c1e09d03fe09770bc9c4bf57&query="")
    
    var movies: [Movie] = []
    
    init() {
        
    }
    
    func searchMovies(completion: (movies: [Movie]) -> Void) {
        guard let url = baseUrl else {
            fatalError("URL for movies is nil")
        }
        
        NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
            guard let data = data else {
                completion(movies: [])
                return
            }
            
            guard let jsonAnyObject = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) else {
                completion(movies: [])
                return
            }
            
            guard let jsonDictionary = jsonAnyObject as? [String: AnyObject] else {
                completion(movies: [])
                return
            }
            
            guard let movieDictionaries = jsonDictionary["results"] as? [[String: AnyObject]] else {
                completion(movies: [])
                return
            }
            
            let movies = movieDictionaries.flatMap({Movie(dictionary: $0)})
            completion(movies: movies)
        }
    }
    
}