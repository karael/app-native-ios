//
//  SuccessTableViewCell.swift
//  film-quizz
//
//  Created by Paul Gabriel on 16/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import UIKit
import Haneke

class RelatedTableViewCell: UITableViewCell {
    
    static let identifier = "relatedCellIdentifier"
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    var movieList: MovieList! {
        didSet {
            
            
            movieTitleLabel.text = movieList.title
            dateLabel.text = movieList.releaseDate
            
            let thumbnailUrlString = movieList.thumbnail
            if let thumbnailUrl = NSURL(string: thumbnailUrlString){
                thumbnailImageView.hnk_setImageFromURL(thumbnailUrl)
            }
        }
    }
}