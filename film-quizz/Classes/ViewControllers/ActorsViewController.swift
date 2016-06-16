//
//  SuccessViewController.swift
//  film-quizz
//
//  Created by Paul Gabriel on 14/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import UIKit

class ActorsViewController: UIViewController {
    

    @IBOutlet weak var actorsTableView: UITableView!
    
    var movieId: String!
    
    lazy var actorsList = [Actor]()
    lazy var items = [[AnyObject]]()
    
    override func viewDidLoad() {
        
        MovieManager.getActors(self.movieId) { (actorsList) in
            
            self.reloadActorsList(actorsList)
            
        }
        
        self.title = "Actors"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        let titleTint: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.titleTextAttributes = titleTint as? [String : AnyObject]
        let nav = self.navigationController?.navigationBar
        // Customizing the navBar text color
        nav?.tintColor = UIColor.whiteColor()
        // Customizing the navBar background color
        nav?.barTintColor = UIColor(red:0.13, green:0.13, blue:0.16, alpha:1.0)
        nav?.translucent = false
        //Getting Light theme for statusBar
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reloadActorsList(actorsList: [Actor]){
        
        self.actorsList.removeAll()
        self.actorsList += actorsList
        
        self.items.append(self.actorsList)
        
        //        self.moviesListTableView.userInteractionEnabled = false
        self.actorsTableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> ActorTableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        
        if section == 0 {
            let actorCell = tableView.dequeueReusableCellWithIdentifier(ActorTableViewCell.identifier, forIndexPath: indexPath) as! ActorTableViewCell
            
            let actorList = actorsList[row]
            
            actorCell.actor = actorList
            actorCell.selectionStyle = .None
            
            return actorCell
        } else {
            return ActorTableViewCell()
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
}