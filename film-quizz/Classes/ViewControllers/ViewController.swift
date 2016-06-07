//
//  ViewController.swift
//  film-quizz
//
//  Created by Paul Gabriel on 06/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let successesSegueIdentifier = "successesSegueIdentifier"
    let playSegueIdentifier = "playSegueIdentifier"
    
    lazy var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        if self.restorationIdentifier == "homeView" || self.restorationIdentifier == "playView" {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
    
}

