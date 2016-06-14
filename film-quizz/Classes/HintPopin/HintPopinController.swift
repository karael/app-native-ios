//
//  HintPopinController.swift
//  film-quizz
//
//  Created by Paul Gabriel on 11/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import UIKit

class HintPopinController: UIViewController {
    
    @IBOutlet weak var popinView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var unlockLabel: UILabel!
    @IBOutlet weak var hintTypeLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var hintImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popinView.clipsToBounds = true
        popinView.layer.cornerRadius = 20
        unlockLabel.layer.cornerRadius = 65
        unlockLabel.layer.masksToBounds = true
        
        self.hintTypeLabel.alpha = 0.0
        self.hintLabel.alpha = 0.0
        self.hintImageView.alpha = 0.0

        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        self.popinView.layer.shadowOpacity = 0.8
        self.popinView.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        
        //Listening to close button
        let closeTapGesture = UITapGestureRecognizer (target: self, action: "closeHintPopin:");
        self.closeButton.addGestureRecognizer(closeTapGesture)
        self.closeButton.userInteractionEnabled = true
        
    }
    
    func showInView(aView: UIView!, animated: Bool)
    {
        aView.addSubview(self.view)
        if animated
        {
            self.showAnimate()
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
    
    func showHint(type: String!, hint: String!){
        hintTypeLabel.text = type
        hintLabel.text = hint
        
        UIView.animateWithDuration(0.25, animations: {
            self.lockImageView.alpha = 0.0
            self.unlockLabel.alpha = 0.0
            self.lockImageView.alpha = 0.0
            self.hintTypeLabel.alpha = 1
            self.hintLabel.alpha = 1
            self.hintImageView.alpha = 1
        })
    }
    
    @IBAction func closePopup(sender: AnyObject) {
        self.removeAnimate()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    func closeHintPopin(gesture: UIGestureRecognizer) {
        self.removeAnimate()
    }
    
    
}
