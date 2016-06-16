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
    @IBOutlet weak var movieDetailsButton: UIButton!
    @IBOutlet weak var movieNextButton: UIButton!
    @IBOutlet weak var popinView: UIView!
    @IBOutlet weak var firstStarImageView: UILabel!
    @IBOutlet weak var secondStarImageView: UIImageView!
    @IBOutlet weak var thirdStarImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondStarImageView.alpha = 0
        thirdStarImageView.alpha = 0
        
        popinView.clipsToBounds = true
        popinView.layer.cornerRadius = 20
        
        scoreLabel.layer.borderWidth = 2
        scoreLabel.layer.borderColor = UIColor(red:0.90, green:0.65, blue:0.24, alpha:1.0).CGColor
        scoreLabel.layer.masksToBounds = true
        scoreLabel.layer.cornerRadius = 65
        

        
    }
    
    func showInView(aView: UIView!, animated: Bool, hints: [Int])
    {
        aView.addSubview(self.view)
        if animated
        {
            self.showAnimate()
            var openHints = 0
            for hint in hints {
                if(hint == 1){
                    openHints += 1
                }
            }
            switch openHints {
            case 0:
                self.scoreLabel.text = "1000 pts"
                self.secondStarImageView.alpha = 1
                self.thirdStarImageView.alpha = 1
            case 1:
                self.scoreLabel.text = "800 pts"
                self.secondStarImageView.alpha = 1
            case 2:
                self.scoreLabel.text = "600 pts"
            case 3:
                self.scoreLabel.text = "400 pts"
            default:
                self.scoreLabel.text = "1000 pts"
            }
        }
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
        self.view.alpha = 0.0;
        UIView.animateWithDuration(0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animateWithDuration(0.25, animations: {
            self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
            self.view.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                if (finished)
                {
                    self.view.removeFromSuperview()
                }
        });
    }
    
    
}
