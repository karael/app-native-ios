//
//  CreditViewController.swift
//  film-quizz
//
//  Created by Paul Gabriel on 16/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import UIKit

class CreditViewcontroller: UIViewController {
    
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        let nav = self.navigationController?.navigationBar
        
        // Customizing the navBar text color
        nav?.tintColor = UIColor.whiteColor()
        // Customizing the navBar background color
        nav?.barTintColor = UIColor(red:0.13, green:0.13, blue:0.16, alpha:1.0)
        nav?.translucent = false
        //Getting Light theme for statusBar
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
    }
}
