//
//  GameViewController.swift
//  film-quizz
//
//  Created by Paul Gabriel on 09/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import UIKit
import AudioToolbox
import Haneke

class GameViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstHintImageView: UIImageView!
    @IBOutlet weak var secondHintImageView: UIImageView!
    @IBOutlet weak var thirdHintImageView: UIImageView!
    @IBOutlet weak var movieNameInput: UITextField!
    @IBOutlet weak var movieIlluImageView: UIImageView!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var loadingLabel: UILabel!
    
    var openHints : [Int] = [0, 0, 0]
    
    var hintPopinController: HintPopinController!
    
    lazy var movie = Movie()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        movieNameInput.alpha = 0
        movieIlluImageView.alpha = 0
        firstHintImageView.alpha = 0
        secondHintImageView.alpha = 0
        thirdHintImageView.alpha = 0
        hintLabel.alpha = 0
        
        MovieManager.getGameMovies() { (movie) in
            self.movie = movie
            print("Movie : \(self.movie.title), \(self.movie.id), \(self.movie.illuPath), \(self.movie.firstHint), \(self.movie.secondHint), \(self.movie.thirdHint)")
            //Setting image
            let illuUrlString = movie.illuPath
            
            if let illuUrl = NSURL(string: illuUrlString){
                self.movieIlluImageView.hnk_setImageFromURL(illuUrl)
            }
            
            UIView.animateWithDuration(0.25, animations: {
                self.movieNameInput.alpha = 1.0
                self.movieIlluImageView.alpha = 1.0
                self.firstHintImageView.alpha = 1.0
                self.secondHintImageView.alpha = 1.0
                self.thirdHintImageView.alpha = 1.0
                self.hintLabel.alpha = 0
                self.loadingLabel.alpha = 0
                self.title = "Score : 1000"
            });
            
            //Listening to tap on images
            let firstHintGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.hintTapped(_:)))
            let secondHintGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.hintTapped(_:)))
            let thirdHintGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.hintTapped(_:)))
            self.firstHintImageView.addGestureRecognizer(firstHintGesture)
            self.firstHintImageView.userInteractionEnabled = true
            self.secondHintImageView.addGestureRecognizer(secondHintGesture)
            self.secondHintImageView.userInteractionEnabled = true
            self.thirdHintImageView.addGestureRecognizer(thirdHintGesture)
            self.thirdHintImageView.userInteractionEnabled = true
        }

        
        movieNameInput.delegate = self
        
        let nav = self.navigationController?.navigationBar
        
        self.view.backgroundColor = UIColor(red:0.19, green:0.18, blue:0.22, alpha:1.0)
        
        //Custom Input
        movieNameInput.textColor = UIColor(red:0.59, green:0.59, blue:0.59, alpha:1.0)
        movieNameInput.backgroundColor = UIColor(red:0.19, green:0.18, blue:0.22, alpha:1.0)
        movieNameInput.layer.cornerRadius = 25
        movieNameInput.layer.borderWidth = 2
        movieNameInput.layer.borderColor = UIColor(red:0.59, green:0.59, blue:0.59, alpha:1.0).CGColor
        
        let placeholder = NSAttributedString(string: "Enter movie film", attributes: [NSForegroundColorAttributeName : UIColor(red:0.59, green:0.59, blue:0.59, alpha:1.0)])
        movieNameInput.attributedPlaceholder = placeholder;
        
        //Show Navigation Bar
        let titleTint: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.titleTextAttributes = titleTint as? [String : AnyObject]
        

        
        //Adding skip button to navbar
        let play = UIBarButtonItem(title: "Skip", style: .Plain, target: self, action: #selector(skipTapped))
        navigationItem.rightBarButtonItem = play
        
        // Customizing the navBar text color
        nav?.tintColor = UIColor.whiteColor()
        // Customizing the navBar background color
        nav?.barTintColor = UIColor(red:0.13, green:0.13, blue:0.16, alpha:1.0)
        nav?.translucent = false
        //Getting Light theme for statusBar
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent

    }
    
    func dismissKeyboard() -> Bool {
        movieNameInput.resignFirstResponder()
        view.endEditing(true)
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GameViewController.dismissKeyboard))
        view.removeGestureRecognizer(tap)
        return true
    }
    
    
    func textFieldDidBeginEditing(movieNameInput: UITextField) {
        animateViewMoving(true, moveValue: 250)
        
        //Handle Keyboard closing on blur
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GameViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    func textFieldDidEndEditing(textField: UITextField) {
        animateViewMoving(false, moveValue: 250)

    }
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:NSTimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = CGRectOffset(self.view.frame, 0,  movement)
        UIView.commitAnimations()
    }
    
    func hintTapped(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            self.hintPopinController = HintPopinController(nibName: "hintPopinController", bundle: nil)
            self.hintPopinController.showInView(self.view, animated: true)
            
            let closeTapGesture = UITapGestureRecognizer (target: self, action: #selector(GameViewController.showHint(_:)))
            self.hintPopinController.unlockLabel.addGestureRecognizer(closeTapGesture)
            self.hintPopinController.unlockLabel.userInteractionEnabled = true
        }
    }
    
    func skipTapped(gesture: UIGestureRecognizer) {
        self.nextMovie()
        print("skip")
    }
    
    func nextMovie() {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextMovie = storyboard.instantiateViewControllerWithIdentifier("GameView") as! GameViewController
        let home = storyboard.instantiateViewControllerWithIdentifier("homeView") as! ViewController

        let backItem = UIBarButtonItem()
        backItem.title = ""
        backItem.target = home
        
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
        
        self.navigationController?.pushViewController(nextMovie, animated: false)

    }
    
    func showHint(gesture: UIGestureRecognizer) {
        for (index, hint) in self.openHints.enumerate() {
            
            if(hint == 0){
                self.openHints[index] = 1
                switch index {
                case 0:
                    self.firstHintImageView.image = UIImage(named: "Hint_open")
                    self.hintPopinController.showHint(movie.firstHintType, hint: movie.firstHint)
                    self.title = "Score : 800"
                case 1:
                    self.secondHintImageView.image = UIImage(named: "Hint_open")
                    self.hintPopinController.showHint(movie.secondHintType, hint: movie.secondHint)
                    self.title = "Score : 600"
                case 2:
                    self.thirdHintImageView.image = UIImage(named: "Hint_open")
                    self.hintPopinController.showHint(movie.thirdHintType, hint: movie.thirdHint)
                    self.title = "Score : 400"
                default:
                    self.firstHintImageView.image = UIImage(named: "Hint_open")
                    self.hintPopinController.showHint(movie.secondHintType, hint: movie.secondHint)
                    self.title = "Score : 1000"
                }
                break
            }
        }
    }
}
