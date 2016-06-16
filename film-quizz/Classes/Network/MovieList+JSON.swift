//
//  MovieList+JSON.swift
//  film-quizz
//
//  Created by Paul Gabriel on 16/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import Foundation
import SwiftyJSON

extension MovieList {
    
    convenience init (json: JSON) {
        self.init()
        
        self.id = json["_id"].stringValue
        self.title = json["title"].stringValue
        self.thumbnail = json["thumbnail"].stringValue
        self.score = json["score"].stringValue
        
        if json["release_date"].stringValue.characters.split("T").map(String.init).count > 0{
            self.releaseDate = json["release_date"].stringValue.characters.split("T").map(String.init)[0] ?? "nil"
        } else {
            self.releaseDate = "nil"
        }
        
    }
    
}