//
//  ImageController.swift
//  MovieSearch
//
//  Created by Emily Mearns on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ImageController {
    
    static func imageForURL(url: String, completion: ((image: UIImage?) -> Void)) {
        
        let imageSearchUrl = "http://image.tmdb.org/t/p/w500"
        
        guard let url = NSURL(string: imageSearchUrl + url) else {
            fatalError("Image URL optional is nil")
        }
        
        NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
            guard let data = data else {
                completion(image: nil)
                return
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(image: UIImage(data: data))
            })
        }
    }
}