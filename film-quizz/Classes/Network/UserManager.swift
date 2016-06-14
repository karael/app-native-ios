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
    
    static let headers = [
        "X-app-UUID": apiIdentity,
        "Content-Type": "application/json"
    ]
    

    static func createUser() {

        
        let createUserUrl = UrlBuilder.createUserUrl(apiIdentity)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(apiIdentity, forKey: "userUUID")
        
        Alamofire.request(.GET, createUserUrl, headers: headers).responseJSON{ (response) in
            if let json = response.result.value as? [String:AnyObject] {
                if JSON(json)["meta"]["code"].intValue == 200 {
                    defaults.setObject(JSON(json)["data"]["_id"].stringValue, forKey: "userId")
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
                }else {
                    self.createUser()
                }
            }
        }
    }
}