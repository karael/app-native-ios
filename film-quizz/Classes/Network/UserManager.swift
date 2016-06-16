//
//  UserManager.swift
//  film-quizz
//
//  Created by Paul Gabriel on 13/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserManager {
    
    static let apiIdentity : String =  (NSUserDefaults.standardUserDefaults().objectForKey("userUUID") ?? NSUUID().UUIDString) as! String
    
    static let headers: [String: String]? = [
        "X-app-UUID": apiIdentity,
        "Content-Type": "application/json"
    ]
    
    typealias PostScore = (result: Bool) -> Void
    typealias SuccessMovieList = (movieList: [MovieList]) -> Void
    

    static func createUser() {
        
        let createUserUrl = UrlBuilder.createUserUrl()
        
        print("create")
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(apiIdentity, forKey: "userUUID")
        
        Alamofire.request(.GET, createUserUrl, headers: headers).responseJSON{ (response) in
            if let json = response.result.value as? [String:AnyObject] {
                if JSON(json)["meta"]["code"].intValue == 200 {
                    defaults.setObject(JSON(json)["data"]["_id"].stringValue, forKey: "userId")
                    print("Identity : \(self.apiIdentity)")
                }
            }
        }
    }
    
    static func retrieveUser() {
        print("retrieve")
        
        let retrieveUserUrl = UrlBuilder.retrieveUserUrl(apiIdentity)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        Alamofire.request(.GET, retrieveUserUrl, headers: headers).responseJSON{ (response) in
            if let json = response.result.value as? [String:AnyObject] {
                if  JSON(json)["meta"]["code"].intValue == 200 {
                    defaults.setObject(JSON(json)["data"]["_id"].stringValue, forKey: "userId")
                    defaults.setObject(self.apiIdentity, forKey: "userUUID")
                    print("Identity : \(self.apiIdentity)")
                }else {
                    self.createUser()
                }
            }
        }
    }
    
    static func submitScore(text: String, hints: [Int], movieId: String, postScore: PostScore) {
        
        let postScoreUrl = UrlBuilder.postScoreUrl()
        
        
        var nbr_index = 0
        for hint in hints {
            if(hint == 1){
                nbr_index += 1
            }
        }
        
        let parameters : [String: AnyObject]? = [
            "id_movie": movieId,
            "id_user": NSUserDefaults.standardUserDefaults().objectForKey("userId")!,
            "response": text,
            "nbr_index": String(nbr_index)
        ];
        
        Alamofire.request(.POST, postScoreUrl, parameters: parameters, encoding: .JSON, headers: headers).responseJSON { (response) in
         
            let result: Bool
            
            if let json = response.result.value as? [String:AnyObject] {
                if JSON(json)["meta"]["code"].intValue == 200 {
                    result = true
                } else {
                    if(JSON(json)["meta"]["message"].stringValue == "You have already find this movie") {
                        result = true
                    } else {
                        result = false
                    }
                }
                postScore(result: result)
            }
        }
    }
    
    static func getSuccessList(successMovieList: SuccessMovieList) {
        let getSuccessList = UrlBuilder.successListUrl()

        Alamofire.request(.GET, getSuccessList, headers: headers).responseJSON { (response) in

            var movieListArray = [MovieList]()

            if let json = response.result.value as? [String: AnyObject] {
                
                if let data = json["data"] as? [AnyObject] {
                    
                    for result in data {
                        let jsonResult = JSON(result)
                        
                        let movieList = MovieList(json: jsonResult)
                        movieListArray.append(movieList)
                    }
                }
                successMovieList(movieList: movieListArray)
            }
        }
    }
}