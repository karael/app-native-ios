//
//  MovieDetailsViewController.swift
//  film-quizz
//
//  Created by Paul Gabriel on 15/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import UIKit
import Haneke

class MovieDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var excerptTextView: UITextView!
    @IBOutlet weak var actorsButton: UIButton!
    @IBOutlet weak var otherMoviesButton: UIButton!
    
    var movieID : String! = nil
    
    lazy var movieDetail = MovieDetail()
    
    override func viewDidLoad() {
        
        actorsButton.layer.cornerRadius = 25
        otherMoviesButton.layer.cornerRadius = 25
        
        MovieManager.getDetailsMovie(movieID) { (movieDetail) in
            
            self.movieDetail = movieDetail
            
            self.movieTitleLabel.text = movieDetail.title
            self.genreLabel.text = "\(movieDetail.genre) (\(movieDetail.releaseDate))"
            self.excerptTextView.text = movieDetail.excerpt
            
            let coverUrlString = movieDetail.coverPath
            
            if let coverUrl = NSURL(string: coverUrlString){
                self.coverImageView.hnk_setImageFromURL(coverUrl)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let segueIdentifier = segue.identifier {
            if segueIdentifier == "movieActorsIdentifier" {
                let actorsViewController = segue.destinationViewController as! ActorsViewController
                
                actorsViewController.movieId = self.movieDetail.id
            } else if segueIdentifier == "relatedIdentifier" {
                let relatedViewController = segue.destinationViewController as! RelatedViewController
                
                relatedViewController.movieId = self.movieDetail.id
            }
        }
    }
}
