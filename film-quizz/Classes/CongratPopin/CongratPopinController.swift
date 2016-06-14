//
//  CongratsPopinController.swift
//
//
//  Created by Paul Gabriel on 11/06/16.
//
//

import UIKit

class CongratsPopinController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var popinView: UIView!
    @IBOutlet weak var movieDetailsButton: UIButton!
    @IBOutlet weak var movieNextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popinView.clipsToBounds = true
        popinView.layer.cornerRadius = 20
        
        scoreLabel.layer.borderWidth = 1
        scoreLabel.layer.borderColor = UIColor(red:0.90, green:0.65, blue:0.24, alpha:1.0).CGColor
        scoreLabel.layer.masksToBounds = true
        scoreLabel.layer.cornerRadius = 65
        
    }
    
    
}
