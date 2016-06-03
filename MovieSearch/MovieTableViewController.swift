//
//  MovieTableViewController.swift
//  MovieSearch
//
//  Created by Emily Mearns on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    var movieController = MovieController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var searchBar: UISearchBar!

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movieController.movies.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath)

        let movie = movieController.movies[indexPath.row]
        titleLabel.text = movie.title
        ratingLabel.text = "Rating: \(movie.vote_average)"
        summaryLabel.text = movie.summary
        ImageController.imageForUrl(movie.poster_path, completion: { (image) in
            self.posterImage.image = image
        })

        return cell
    }

}
