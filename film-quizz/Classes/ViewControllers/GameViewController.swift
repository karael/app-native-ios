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
    
    var openHints : [Int] = [0, 0, 0]
    
    var hintPopinController: HintPopinController!
    
    var movie: Movie!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    override func viewDidLoad() {
        print("Movie : \(movie.title), \(movie.id), \(movie.illuPath)")
        
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
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.title = "Score : 2200"
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]

        
        //Adding skip button to navbar
        let play = UIBarButtonItem(title: "Skip", style: .Plain, target: self, action: #selector(skipTapped))
        navigationItem.rightBarButtonItem = play
        
        // Customizing the navBar text color
        nav!.tintColor = UIColor.whiteColor()
        // Customizing the navBar background color
        nav!.barTintColor = UIColor(red:0.13, green:0.13, blue:0.16, alpha:1.0)
        nav!.translucent = false
        //Getting Light theme for statusBar
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        //Listening to tap on images
        let firstHintGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.hintTapped(_:)))
        let secondHintGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.hintTapped(_:)))
        let thirdHintGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.hintTapped(_:)))
        firstHintImageView.addGestureRecognizer(firstHintGesture)
        firstHintImageView.userInteractionEnabled = true
        secondHintImageView.addGestureRecognizer(secondHintGesture)
        secondHintImageView.userInteractionEnabled = true
        thirdHintImageView.addGestureRecognizer(thirdHintGesture)
        thirdHintImageView.userInteractionEnabled = true
        
        
        //Setting image
        let illuUrlString = UrlBuilder.illuUrl(movie.illuPath)
        
        if let illuUrl = NSURL(string: illuUrlString){
            self.movieIlluImageView.hnk_setImageFromURL(illuUrl)
        }
        

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
        print("skip tapped")
    }
    
    func showHint(gesture: UIGestureRecognizer) {
        for (index, hint) in self.openHints.enumerate() {
            
            if(hint == 0){
                self.openHints[index] = 1
                print(index)
                print(self.openHints)
                switch index {
                case 0:
                    self.firstHintImageView.image = UIImage(named: "Hint_open")
                case 1:
                    self.secondHintImageView.image = UIImage(named: "Hint_open")
                case 2:
                    self.thirdHintImageView.image = UIImage(named: "Hint_open")
                default:
                    self.firstHintImageView.image = UIImage(named: "Hint_open")
                }

                self.hintPopinController.showHint("int \(index) open", hint: "Lol")
                
                break
            }
        }
    }
}
