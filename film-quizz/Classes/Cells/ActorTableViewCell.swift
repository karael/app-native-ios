//
//  SuccessTableViewCell.swift
//  film-quizz
//
//  Created by Paul Gabriel on 16/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import UIKit
import Haneke

class ActorTableViewCell: UITableViewCell {
    
    static let identifier = "actorCellIdentifier"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var roleLabel: UILabel!
    
    var actor: Actor! {
        didSet {

            nameLabel.text = actor.name
            roleLabel.text = actor.role
            
            let pictureUrlString = actor.poster
            if let pictureUrl = NSURL(string: pictureUrlString){
                pictureImageView.hnk_setImageFromURL(pictureUrl)
            }
        }
    }
}