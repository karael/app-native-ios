//
//  SuccessTableViewCell.swift
//  film-quizz
//
//  Created by Paul Gabriel on 16/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import UIKit
import Haneke

class SuccessTableViewCell: UITableViewCell {
    
    static let identifier = "successCellIdentifier"
    
    @IBOutlet weak var titleMovieLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var firstStarImageView: UIImageView!
    @IBOutlet weak var secondStarImageView: UIImageView!
    @IBOutlet weak var thirdStarImageView: UIImageView!
    
    var movieList: MovieList! {
        didSet {


            titleMovieLabel.text = movieList.title
            scoreLabel.text = movieList.score
            
            let thumbnailUrlString = movieList.thumbnail
            if let thumbnailUrl = NSURL(string: thumbnailUrlString){
                thumbnailImageView.hnk_setImageFromURL(thumbnailUrl)
            }
            if Int(movieList.score) < 700 {
                thirdStarImageView.image = UIImage(named: "Star_vide")
                secondStarImageView.image = UIImage(named: "Star_vide")
            } else if Int(movieList.score) == 800 {
                thirdStarImageView.image = UIImage(named: "Star_vide")
            }
        }
    }
}