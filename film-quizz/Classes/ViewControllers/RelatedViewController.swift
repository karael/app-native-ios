//
//  SuccessViewController.swift
//  film-quizz
//
//  Created by Paul Gabriel on 14/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import UIKit

class RelatedViewController: UIViewController {
    
    
    @IBOutlet weak var moviesListTableView: UITableView!
    
    
    var movieId: String!
    
    lazy var moviesList = [MovieList]()
    lazy var items = [[AnyObject]]()
    
    override func viewDidLoad() {
        
        MovieManager.getRelatedList(self.movieId) { (moviesList) in
            
            self.reloadMoviesList(moviesList)
            for movieList in moviesList {
                print(movieList.title)
            }
            
        }
        
        self.title = "Related movies"
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
    
    func reloadMoviesList(moviesList: [MovieList]){
        
        self.moviesList.removeAll()
        self.moviesList += moviesList
        
        self.items.append(self.moviesList)
        
        self.moviesListTableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> RelatedTableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        
        if section == 0 {
            let movieListCell = tableView.dequeueReusableCellWithIdentifier(RelatedTableViewCell.identifier, forIndexPath: indexPath) as! RelatedTableViewCell
            
            let movieList = moviesList[row]
            
            movieListCell.movieList = movieList
            movieListCell.selectionStyle = .None
            
            return movieListCell
        } else {
            return RelatedTableViewCell()
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