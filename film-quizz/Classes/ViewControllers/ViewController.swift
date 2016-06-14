//
//  ViewController.swift
//  film-quizz
//
//  Created by Paul Gabriel on 06/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var PlayButton: UIButton!
    @IBOutlet weak var SuccessButton: UIButton!
    
    let launchedBefore = NSUserDefaults.standardUserDefaults().boolForKey("launchedBefore")

    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        if self.launchedBefore  {
            UserManager.retrieveUser()
        }
        else {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "launchedBefore")
            UserManager.createUser()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:0.19, green:0.18, blue:0.22, alpha:1.0)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        PlayButton.layer.cornerRadius = 20
        PlayButton.layer.backgroundColor = UIColor(red:0.93, green:0.46, blue:0.40, alpha:1.0).CGColor
        SuccessButton.layer.cornerRadius = 20
        SuccessButton.layer.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0).CGColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        MovieManager.getGameMovies() { (movie) in
            self.gameMovie = movie
            print("Movie : \(self.gameMovie.title), \(self.gameMovie.id), \(self.gameMovie.illuPath), \(self.gameMovie.firstHint), \(self.gameMovie.secondHint), \(self.gameMovie.thirdHint)")
        }

        
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
        
        if let segueIdentifier = segue.identifier {
            if segueIdentifier == "gameSegueIdentifier" {
                let gameViewController = segue.destinationViewController as! GameViewController
                
                
                gameViewController.movie = self.gameMovie
                
            }
        }
    }
}

